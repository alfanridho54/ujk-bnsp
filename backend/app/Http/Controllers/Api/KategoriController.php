<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Resources\KategoriResource;

use App\Models\Kategori;

class KategoriController extends Controller
{
    public function index()
    {
        $kategoris = Kategori::all();
        return KategoriResource::collection($kategoris);
    }   
}

