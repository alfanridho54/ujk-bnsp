<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class WisataResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id_wisata'   => $this->id_wisata,
            'nama_wisata' => $this->nama_wisata,
            'deskripsi'   => $this->deskripsi,
            'alamat'      => $this->alamat,
            'url_foto'    => $this->url_foto,
            'kota'        => new KotaResource($this->whenLoaded('kota')),
            'kategori'    => new KategoriResource($this->whenLoaded('kategori')),
        ];
    }
}