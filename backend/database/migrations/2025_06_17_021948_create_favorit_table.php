<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('favorit', function (Blueprint $table) {
          
            $table->foreignId('user_id')->constrained('users')->onDelete('cascade');
            
            
            $table->foreignId('id_wisata')->constrained('tempat_wisatas', 'id_wisata')->onDelete('cascade');
            
            $table->primary(['user_id', 'id_wisata']);
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('favorit');
    }
};