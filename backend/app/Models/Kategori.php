<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Kategori extends Model
{
    use HasFactory;

    /**
     * Menentukan primary key kustom.
     */
    protected $table = 'kategori';
    protected $primaryKey = 'id_kategori';

    /**
     * Mendefinisikan relasi one-to-many ke TempatWisata.
     * Satu kategori bisa memiliki banyak tempat wisata.
     */
    public function tempatWisatas(): HasMany
    {
        return $this->hasMany(TempatWisata::class, 'id_kategori', 'id_kategori');
    }
}
