<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\KotaResource;
use App\Models\Kota;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class KotaController extends Controller
{
    /**
     * Menampilkan daftar semua kota.
     */
    public function index()
    {
        $kotas = Kota::orderBy('nama_kota')->get();
        return KotaResource::collection($kotas);
    }

    /**
     * Menyimpan data kota baru ke database.
     */
    public function store(Request $request)
    {
        // Validasi input
        $validator = Validator::make($request->all(), [
            'nama_kota' => 'required|string|max:100|unique:kota,nama_kota',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Validasi gagal.',
                'errors'  => $validator->errors()
            ], 422);
        }

        // Buat dan simpan kota baru
        $kota = new Kota();
        $kota->nama_kota = $request->nama_kota;
        $kota->save();

        // Kembalikan respons sukses
        return response()->json([
            'success' => true,
            'message' => 'Kota berhasil ditambahkan.',
            'data'    => new KotaResource($kota)
        ], 201);
    }
}
