import 'package:flutter/material.dart';
import 'package:info_wisata_app/models/wisata.dart';

class DetailWisataScreen extends StatelessWidget {
  final Wisata wisata;

  const DetailWisataScreen({super.key, required this.wisata});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(wisata.nama),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Wisata
            wisata.urlFoto != null
                ? Image.network(
                    wisata.urlFoto!,
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.broken_image, size: 250),
                  )
                : const Icon(Icons.image, size: 250),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Judul Wisata
                  Text(
                    wisata.nama,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),

                  // Alamat
                  if (wisata.alamat != null)
                    Row(
                      children: [
                        const Icon(Icons.location_on, color: Colors.grey, size: 16),
                        const SizedBox(width: 8),
                        Expanded(child: Text(wisata.alamat!, style: const TextStyle(color: Colors.grey))),
                      ],
                    ),
                  const SizedBox(height: 20),

                  // Deskripsi
                  Text(
                    'Deskripsi',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    wisata.deskripsi,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}