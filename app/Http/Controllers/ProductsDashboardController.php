<?php

namespace App\Http\Controllers;

use App\Models\products;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class ProductsDashboardController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $products = products::orderBy('created_at', 'desc')->get();
        return view('backend.products.index', compact('products'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('backend.products.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'foto' => 'required|image',
            'nama' => 'required|string|max:255',
            'deskripsi' => 'required',
            'harga' => 'required|integer',
            'qty' => 'required|integer',
            'show' => 'nullable|boolean',
        ]);

        // Handle file upload for 'foto'
        if ($request->hasFile('foto')) {
            $fotoPath = $request->file('foto')->store('uploads/foto_product', 'public');
            $validatedData['foto'] = $fotoPath;
        } else {
            $validatedData['foto'] = null;
        }


        $validatedData['show'] = $request->has('show') ? 1 : 0;
        products::create($validatedData);

        return redirect()->route('products_dashboard')->with('success', 'Product berhasil ditambahkan!');
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $product = products::findOrFail($id);
        return view('backend.products.edit', compact('product'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        // Validate input
        $validatedData = $request->validate([
            'foto' => 'nullable|image',
            'nama' => 'required|string|max:255',
            'deskripsi' => 'required',
            'harga' => 'required|integer',
            'qty' => 'required|integer',
            'show' => 'nullable|boolean',
        ]);


        $product = products::findOrFail($id);


        if ($request->hasFile('foto')) {

            if ($product->foto) {
                Storage::disk('public')->delete($product->foto);
            }

            $fotoPath = $request->file('foto')->store('uploads/foto_product', 'public');
            $validatedData['foto'] = $fotoPath;
        }


        $validatedData['show'] = $request->has('show') ? 1 : 0;


        $product->update($validatedData);


        return redirect()->route('products_dashboard')->with('success', 'Product berhasil diperbarui!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $products = products::findOrFail($id);

        $file_path = 'public/' . $products->foto;

        if ($products->foto && Storage::exists($file_path)) {
            Storage::delete($file_path);
        }

        $products->delete();

        return redirect()->route('products_dashboard')->with('success', 'Product berhasil dihapus!');
    }

    public function dashboard () {
        return view('backend.dashboard');
    }
}
