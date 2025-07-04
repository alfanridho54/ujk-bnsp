<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('tempat_wisatas', function (Blueprint $table) {
            $table->id('id_wisata');
            $table->foreignId('id_kota')->constrained('kota', 'id_kota');
            $table->foreignId('id_kategori')->constrained('kategori', 'id_kategori');
            $table->string('nama_wisata');
            $table->text('deskripsi')->nullable();
            $table->string('alamat')->nullable();
            $table->string('url_foto')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('tempat_wisatas');
    }
};