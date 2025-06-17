<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Kota extends Model
{
    use HasFactory;

    /**
     * Menentukan nama tabel kustom karena tidak mengikuti konvensi plural Laravel.
     */
    protected $table = 'kota';

    /**
     * Menentukan primary key kustom.
     */
    protected $primaryKey = 'id_kota';

    /**
     * Mendefinisikan relasi one-to-many ke TempatWisata.
     * Satu kota bisa memiliki banyak tempat wisata.
     */
    public function tempatWisatas(): HasMany
    {
        return $this->hasMany(TempatWisata::class, 'id_kota', 'id_kota');
    }
}
