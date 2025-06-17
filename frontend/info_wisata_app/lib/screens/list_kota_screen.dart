import 'package:flutter/material.dart';
import 'package:info_wisata_app/models/kota.dart';
import 'package:info_wisata_app/screens/wisata_by_city.dart'; // <-- Import halaman baru
import 'package:info_wisata_app/services/api_service.dart';

class CityListScreen extends StatefulWidget {
  const CityListScreen({super.key});

  @override
  _CityListScreenState createState() => _CityListScreenState();
}

class _CityListScreenState extends State<CityListScreen> {
  late Future<List<Kota>> _kotaFuture;
  final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _kotaFuture = _apiService.getKotas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jelajahi Berdasarkan Kota'),
      ),
      body: FutureBuilder<List<Kota>>(
        future: _kotaFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Tidak ada data kota.'));
          }

          final kotaList = snapshot.data!;
          return ListView.builder(
            itemCount: kotaList.length,
            itemBuilder: (context, index) {
              final kota = kotaList[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  leading: const Icon(Icons.location_city_outlined, color: Colors.teal),
                  title: Text(kota.namaKota, style: const TextStyle(fontWeight: FontWeight.w500)),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // Navigasi ke halaman baru dengan membawa ID dan Nama Kota
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => WisataByCityScreen(
                          cityId: kota.idKota,
                          cityName: kota.namaKota,
                        ),
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
