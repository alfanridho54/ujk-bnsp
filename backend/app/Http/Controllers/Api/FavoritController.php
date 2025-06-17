<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\WisataCollection;
use App\Models\TempatWisata;
use Illuminate\Support\Facades\Auth;

class FavoritController extends Controller
{
    /**
     * Menampilkan daftar favorit milik pengguna yang sedang login.
     */
    public function index()
    {
        $user = Auth::user();
        $favorit = $user->favorit()->with(['kota', 'kategori'])->get();

        // Gunakan WisataCollection untuk daftar favorit
        return new WisataCollection($favorit, "Data Favorit Berhasil Diambil");
    }

    /**
     * Menambahkan wisata ke daftar favorit.
     */
    public function store($id_wisata)
    {
        // Validasi apakah tempat wisata ada
        if (!TempatWisata::find($id_wisata)) {
            return response()->json([
                'success' => false,
                'message' => 'Tempat wisata tidak ditemukan.'
            ], 404);
        }

        $user = Auth::user();
        // syncWithoutDetaching mencegah duplikasi
        $user->favorit()->syncWithoutDetaching([$id_wisata]);

        return response()->json([
            'success' => true,
            'message' => 'Berhasil ditambahkan ke favorit.'
        ], 201);
    }

    /**
     * Menghapus wisata dari daftar favorit.
     */
    public function destroy($id_wisata)
    {
        $user = Auth::user();
        // detach akan menghapus relasi. Hasilnya adalah jumlah baris yang dihapus.
        $detached = $user->favorit()->detach($id_wisata);

        if ($detached === 0) {
            // Jika tidak ada yang dihapus, berarti data tidak ada di favorit user
            return response()->json([
                'success' => false,
                'message' => 'Data tidak ditemukan di dalam daftar favorit Anda.'
            ], 404);
        }

        return response()->json([
            'success' => true,
            'message' => 'Berhasil dihapus dari favorit.'
        ], 200);
    }
}
