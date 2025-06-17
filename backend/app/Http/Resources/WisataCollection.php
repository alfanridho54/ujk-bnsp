<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\ResourceCollection;

class WisataCollection extends ResourceCollection
{
    // Properti untuk membuat pesan dinamis
    public $message;

    /**
     * Buat constructor untuk menerima resource dan pesan kustom.
     */
    public function __construct($resource, $message = "Data berhasil diambil")
    {
        parent::__construct($resource);
        $this->message = $message;
    }

    /**
     * Transform the resource collection into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        // Di sini kita membuat struktur "amplop" yang konsisten
        return [
            'success'   => true,
            'message'   => $this->message,
            'data'      => $this->collection,
        ];
    }
}
