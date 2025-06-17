<?php

use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\FavoritController;
use App\Http\Controllers\Api\KategoriController;
use App\Http\Controllers\Api\KotaController;
use App\Http\Controllers\Api\WisataController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

// --- Rute Publik ---
Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);

Route::get('/kota', [KotaController::class, 'index']);
Route::get('/kategori', [KategoriController::class, 'index']);
Route::get('/wisata', [WisataController::class, 'index']);
Route::get('/wisata/{id}', [WisataController::class, 'show']);


// --- Rute Terproteksi ---
Route::middleware('auth:sanctum')->group(function () {
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::get('/user', fn(Request $request) => $request->user());
    
    // Rute untuk Kota
    Route::post('/kota', [KotaController::class, 'store']); // <-- RUTE BARU DITAMBAHKAN DI SINI

    // Rute untuk Favorit
    Route::get('/favorit', [FavoritController::class, 'index']);
    Route::post('/favorit/{id_wisata}', [FavoritController::class, 'store']);
    Route::delete('/favorit/{id_wisata}', [FavoritController::class, 'destroy']);
});
