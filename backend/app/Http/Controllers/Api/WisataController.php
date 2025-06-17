<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\WisataCollection; // <-- Gunakan Collection
use App\Http\Resources\WisataResource;    // <-- Gunakan Resource biasa
use App\Models\TempatWisata;
use Illuminate\Http\Request;

class WisataController extends Controller
{
    /**
     * Menampilkan daftar semua wisata dengan filter.
     */
    public function index(Request $request)
    {
        $query = TempatWisata::with(['kota', 'kategori']);

        // Terapkan filter jika ada
        if ($request->has('id_kota')) {
            $query->where('id_kota', $request->id_kota);
        }

        // Gunakan paginasi agar lebih efisien
        $wisatas = $query->latest()->paginate(10);

        // Kembalikan hasilnya menggunakan WisataCollection yang baru dibuat
        return new WisataCollection($wisatas, "Daftar Wisata Berhasil Diambil");
    }

    /**
     * Menampilkan detail satu tempat wisata.
     */
    public function show($id_wisata)
    {
        $wisata = TempatWisata::with(['kota', 'kategori'])->findOrFail($id_wisata);

        // Kembalikan data tunggal, dibungkus dengan format respons yang sama
        return response()->json([
            'success' => true,
            'message' => 'Detail Data Wisata',
            'data'    => new WisataResource($wisata)
        ]);
    }
}
