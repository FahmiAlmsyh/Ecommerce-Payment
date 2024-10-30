<?php

namespace App\Http\Middleware;

use App\Models\products;
use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class show_active
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        $product = products::find($request->route('id'));

        if (!$product || !$product->show) {

            return redirect()->route('index')->with('error', 'This product is not available.');
        }

        return $next($request);
    }
}
