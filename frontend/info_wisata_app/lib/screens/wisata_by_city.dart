import 'package:flutter/material.dart';
import 'package:info_wisata_app/models/wisata.dart';
import 'package:info_wisata_app/providers/auth_provider.dart';
import 'package:info_wisata_app/services/api_service.dart';
import 'package:info_wisata_app/screens/detail_wisata_screen.dart';
import 'package:provider/provider.dart';

class WisataByCityScreen extends StatefulWidget {
  final int cityId;
  final String cityName;

  const WisataByCityScreen({
    super.key,
    required this.cityId,
    required this.cityName,
  });

  @override
  _WisataByCityScreenState createState() => _WisataByCityScreenState();
}

class _WisataByCityScreenState extends State<WisataByCityScreen> {
  late Future<List<Wisata>> _wisataFuture;
  final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    // Panggil getWisata dengan filter idKota
    _wisataFuture = _apiService.getWisata(idKota: widget.cityId);
  }

  void _addFavorite(int idWisata, String namaWisata) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final token = authProvider.token;

    if (token == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Anda harus login untuk menambahkan favorit.')),
      );
      return;
    }

    _apiService.addFavorite(token, idWisata).then((success) {
      if (success && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$namaWisata berhasil ditambahkan ke favorit!'),
            backgroundColor: Colors.green,
          ),
        );
      } else if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Gagal menambahkan $namaWisata ke favorit.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wisata di ${widget.cityName}'),
      ),
      body: FutureBuilder<List<Wisata>>(
        future: _wisataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Tidak ada data wisata untuk kota ini.'));
          }

          final wisataList = snapshot.data!;
          return ListView.builder(
            itemCount: wisataList.length,
            itemBuilder: (context, index) {
              final wisata = wisataList[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  title: Text(wisata.nama),
                  subtitle: Text(
                    wisata.deskripsi.length > 80 
                        ? '${wisata.deskripsi.substring(0, 80)}...' 
                        : wisata.deskripsi,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.favorite_border, color: Colors.redAccent),
                    tooltip: 'Tambahkan ke Favorit',
                    onPressed: () => _addFavorite(wisata.id, wisata.nama),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DetailWisataScreen(wisata: wisata),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
