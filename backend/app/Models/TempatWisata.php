<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class TempatWisata extends Model
{
    use HasFactory;

    /**
     * Menentukan primary key kustom.
     */
    protected $table = 'tempat_wisatas';
    protected $primaryKey = 'id_wisata';


    /**
     * Mendefinisikan relasi "milik" (belongs to) ke Kota.
     * Satu tempat wisata hanya dimiliki oleh satu kota.
     */
    public function kota(): BelongsTo
    {
        return $this->belongsTo(Kota::class, 'id_kota', 'id_kota');
    }

    /**
     * Mendefinisikan relasi "milik" (belongs to) ke Kategori.
     * Satu tempat wisata hanya dimiliki oleh satu kategori.
     */
    public function kategori(): BelongsTo
    {
        return $this->belongsTo(Kategori::class, 'id_kategori', 'id_kategori');
    }

    /**
     * Mendefinisikan relasi many-to-many ke User.
     * Untuk mendapatkan daftar user yang telah memfavoritkan tempat ini.
     */
    public function difavoritkanOleh(): BelongsToMany
    {
        return $this->belongsToMany(User::class, 'favorit', 'id_wisata', 'user_id');
    }
}
