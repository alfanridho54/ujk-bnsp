import 'package:flutter/material.dart';
import 'package:info_wisata_app/models/wisata.dart';
import 'package:info_wisata_app/providers/auth_provider.dart';
import 'package:info_wisata_app/services/api_service.dart';
import 'package:provider/provider.dart';

class FavoritScreen extends StatefulWidget {
  const FavoritScreen({super.key});

  @override
  State<FavoritScreen> createState() => _FavoritScreenState();
}

class _FavoritScreenState extends State<FavoritScreen> {
  late Future<List<Wisata>> _favoritFuture;
  final ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    // Ambil token dari provider untuk memanggil API
    final token = Provider.of<AuthProvider>(context, listen: false).token;
    if (token != null) {
      _favoritFuture = apiService.getFavorites(token);
    }
  }

  @override
  Widget build(BuildContext context) {
    // AppBar sekarang ada di MainScreen, jadi di sini tidak perlu Scaffold lagi
    return Scaffold(
      appBar: AppBar(title: const Text('Wisata Favorit Saya')),
      body: FutureBuilder<List<Wisata>>(
        future: _favoritFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Anda belum memiliki wisata favorit.'));
          }

          final favoritList = snapshot.data!;
          return ListView.builder(
            itemCount: favoritList.length,
            itemBuilder: (context, index) {
              final wisata = favoritList[index];
              return Card(
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(wisata.nama),
                  subtitle: Text(wisata.deskripsi.length > 50 ? '${wisata.deskripsi.substring(0, 50)}...' : wisata.deskripsi),
                  // Di sini bisa ditambahkan tombol untuk menghapus favorit
                ),
              );
            },
          );
        },
      ),
    );
  }
}