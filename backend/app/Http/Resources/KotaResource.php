<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class KotaResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        // Kembalikan ke bentuk standar, hanya memformat data kota
        return [
            'id_kota'   => $this->id_kota,
            'nama_kota' => $this->nama_kota,
        ];
    }
}