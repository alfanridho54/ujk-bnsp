import 'package:flutter/material.dart';
import 'package:info_wisata_app/models/wisata.dart';
import 'package:info_wisata_app/screens/detail_wisata_screen.dart';
import 'package:info_wisata_app/services/api_service.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Wisata>> _wisataFuture;
  final ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _wisataFuture = apiService.getWisata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Wisata'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Provider.of<AuthProvider>(context, listen: false).logout();
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Wisata>>(
        future: _wisataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Tidak ada data wisata.'));
          }

          final wisataList = snapshot.data!;
          return ListView.builder(
            itemCount: wisataList.length,
            itemBuilder: (context, index) {
              final wisata = wisataList[index];
              return Card(
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(wisata.nama),
                  subtitle: Text(wisata.deskripsi),
                  trailing: IconButton(
                    icon: const Icon(Icons.favorite_border, color: Colors.red),
                    onPressed: () {
                      final token = Provider.of<AuthProvider>(context, listen: false).token;
                      if (token != null) {
                        apiService.addFavorite(token, wisata.id).then((success) {
                          if (success) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('${wisata.nama} ditambahkan ke favorit!')),
                            );
                          }
                        });
                      }
                    },
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
