<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\ProductsDashboardController;
use App\Http\Middleware\isAdmin;
use App\Http\Middleware\show_active;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/
// ADMIN ROUTES
Route::middleware([isAdmin::class])->group(function () {
    Route::resource('products_dashboard', ProductsDashboardController::class)->except(['show'])->names([
        'index' => 'products_dashboard',
        'create' => 'products_dashboard.create',
        'store' => 'products_dashboard.store',
        'edit' => 'products_dashboard.edit',
        'update' => 'products_dashboard.update',
        'destroy' => 'products_dashboard.destroy',
    ]);

    Route::post('logout', [AuthController::class, 'logout'])->name('logout');

    Route::get('dashboard', [ProductsDashboardController::class, 'dashboard'])->name('dashboard');
});

// AUTHENTICATION ROUTES
Route::post('logout', [AuthController::class, 'logout'])->name('logout');
Route::get('login', [AuthController::class, 'index'])->name('login');
Route::get('daftar', [AuthController::class, 'daftar'])->name('daftar');
Route::post('register', [AuthController::class, 'register'])->name('register');
Route::post('masuk', [AuthController::class, 'login'])->name('masuk');

// CART MUST BE LOGIN
Route::middleware(['auth'])->group(function () {
    Route::get('cart', [HomeController::class, 'cart'])->name('cart');
    Route::post('/cart/{id}', [HomeController::class, 'cartAdd'])->name('cart-add');
    Route::delete('/cart/{id}', [HomeController::class, 'cartDelete'])->name('cart-delete');
    Route::post('/checkout', [HomeController::class, 'checkout'])->name('checkout');
});

// HOME INDEX
Route::get('home', [HomeController::class, 'index'])->name('index');

// DETAIL MUST BE SHOW
Route::middleware([show_active::class])->group(function () {
    Route::get('home/{id}/detail', [HomeController::class, 'show'])->name('detail');
});


