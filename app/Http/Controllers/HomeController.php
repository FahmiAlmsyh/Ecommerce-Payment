<?php

namespace App\Http\Controllers;

use App\Models\carts;
use App\Models\products;
use App\Models\transaction_item;
use App\Models\transactions;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Midtrans\Config;

class HomeController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $products = products::where('show', true)
            ->orderBy('created_at', 'desc')
            ->get();

        return view('frontend.index', compact('products'));
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $products = products::findOrFail($id);

        return view('frontend.detail', compact('products'));
    }

    public function cart(Request $request)
    {
        $carts = carts::with(['product'])
            ->where('user_id', Auth::user()->id)
            ->whereHas('product', function ($query) {
                $query->where('show', true);
            })
            ->orderBy('created_at', 'DESC')
            ->get();

        return view('frontend.cart', compact('carts'));
    }

    public function cartAdd(Request $request, $id)
    {

        $cartItem = carts::where('user_id', Auth::user()->id)
            ->where('product_id', $id)
            ->first();

        if ($cartItem) {

            $cartItem->qty += $request->qty;
            $cartItem->save();
        } else {

            carts::create([
                'user_id' => Auth::user()->id,
                'product_id' => $id,
                'qty' => $request->qty
            ]);
        }

        return redirect('cart');
    }

    public function cartDelete(Request $request, $id)
    {
        $item = Carts::findOrFail($id);

        $item->delete();

        return redirect('cart');
    }

    public function checkout(Request $request) {

        $data = $request->all();
        $userId = Auth::user()->id;


        $carts = Carts::with(['product'])->where('user_id', $userId)->get();


        $data['user_id'] = $userId;
        $data['total_price'] = $carts->sum(function ($cart) {
            return $cart->product->harga * $cart->qty; // Assuming qty is stored in cart
        });


        $transaction = Transactions::create($data);


        foreach ($carts as $cart) {

            transaction_item::create([
                'transaction_id' => $transaction->id,
                'user_id' => $cart->user_id,
                'product_id' => $cart->product_id,
                'qty' => $cart->qty
            ]);


            $product = Products::find($cart->product_id);
            if ($product) {
                $product->qty -= $cart->qty;
                $product->save();
            }
        }


        Carts::where('user_id', $userId)->delete();


        Config::$serverKey = config('services.midtrans.serverKey');
        Config::$isProduction = config('services.midtrans.isProduction');
        Config::$isSanitized = config('services.midtrans.isSanitized');
        Config::$is3ds = config('services.midtrans.is3ds');

        $midtrans = [
            'transaction_details' => [
                'order_id' => 'LUX-' . $transaction->id,
                'gross_amount' => (int) $transaction->total_price
            ],
            'customer_details' => [
                'first_name' => $transaction->name,
                'email' => $transaction->email
            ],
            'enabled_payments' => ['gopay', 'bank_transfer'],
            'vtweb' => []
        ];


        try {
            $paymentUrl = \Midtrans\Snap::createTransaction($midtrans)->redirect_url;


            $transaction->payment_url = $paymentUrl;
            $transaction->save();
            return redirect($paymentUrl);
        } catch (Exception $e) {
            
            Log::error('Midtrans payment error: ' . $e->getMessage());
            return redirect()->back()->with('error', 'Payment processing failed. Please try again later.');
        }
    }



}
