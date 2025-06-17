import 'package:flutter/material.dart';
import 'package:info_wisata_app/screens/add_city_screen.dart';
import 'package:info_wisata_app/screens/list_kategori.dart'; // <-- Import halaman baru
import 'package:info_wisata_app/screens/list_kota_screen.dart';     // <-- Import halaman baru
import 'package:info_wisata_app/screens/favorit_screen.dart';
import 'package:info_wisata_app/screens/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // Tambahkan halaman baru ke dalam daftar widget
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    FavoritScreen(),
    CityListScreen(),     // <-- Halaman Kota
    CategoryListScreen(), // <-- Halaman Kategori
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // Tambahkan item baru ke navigasi
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorit'),
          BottomNavigationBarItem(icon: Icon(Icons.location_city), label: 'Kota'),   // <-- Item Kota
          BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Kategori'), // <-- Item Kategori
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey, // Tambahkan ini agar item yang tidak aktif terlihat
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const AddCityScreen()),
          );
        },
        tooltip: 'Tambah Kota',
        child: const Icon(Icons.add_location_alt_outlined),
      ),
    );
  }
}
