import 'package:flutter/material.dart';
import 'package:info_wisata_app/models/kategori.dart';
import 'package:info_wisata_app/services/api_service.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  @override
  _CategoryListScreenState createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  late Future<List<Kategori>> _kategoriFuture;
  final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _kategoriFuture = _apiService.getKategoris();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Kategori'),
      ),
      body: FutureBuilder<List<Kategori>>(
        future: _kategoriFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Tidak ada data kategori.'));
          }

          final kategoriList = snapshot.data!;
          return ListView.builder(
            itemCount: kategoriList.length,
            itemBuilder: (context, index) {
              final kategori = kategoriList[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  leading: const Icon(Icons.category),
                  title: Text(kategori.namaKategori),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
