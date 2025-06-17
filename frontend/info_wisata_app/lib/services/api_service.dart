import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/wisata.dart';
import '../models/kota.dart';
import '../models/kategori.dart';

class ApiService {
  // Ganti dengan IP Address lokal Anda jika menjalankan di HP fisik.
  // 10.0.2.2 adalah localhost untuk emulator Android.
  final String _baseUrl = "http://10.0.2.2:8000/api";

  // Method untuk Register
  Future<Map<String, dynamic>> register(String name, String email, String password, String passwordConfirmation) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/register'),
      headers: {'Accept': 'application/json'},
      body: {
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': passwordConfirmation,
      },
    );
    return jsonDecode(response.body);
  }

  // Method untuk Login
  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/login'),
      headers: {'Accept': 'application/json'},
      body: {'email': email, 'password': password},
    );
    return jsonDecode(response.body);
  }

  // Method untuk mengambil daftar wisata
  Future<List<Wisata>> getWisata({int? idKota, int? idKategori}) async {
    var uri = Uri.parse('$_baseUrl/wisata');
    
    // Siapkan map untuk query parameter
    final Map<String, String> queryParameters = {};
    if (idKota != null) {
      queryParameters['id_kota'] = idKota.toString();
    }
    if (idKategori != null) {
      queryParameters['id_kategori'] = idKategori.toString();
    }

    // Jika ada parameter, tambahkan ke URI
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonObject = jsonDecode(response.body);
      List jsonResponse = jsonObject['data'];
      return jsonResponse.map((wisata) => Wisata.fromJson(wisata)).toList();
    } else {
      throw Exception('Gagal memuat data wisata: ${response.body}');
    }
  }

  // ==========================================================
  // METHOD YANG HILANG - SUDAH DITAMBAHKAN DI SINI
  // ==========================================================
  /// Mengambil daftar favorit milik user yang sedang login
  Future<List<Wisata>> getFavorites(String token) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/favorit'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonObject = jsonDecode(response.body);
      List jsonResponse = jsonObject['data'];
      return jsonResponse.map((wisata) => Wisata.fromJson(wisata)).toList();
    } else {
      throw Exception('Gagal memuat favorit: ${response.body}');
    }
  }
  
  // Method untuk menambah favorit (membutuhkan token)
  Future<bool> addFavorite(String token, int idWisata) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/favorit/$idWisata'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    return response.statusCode == 201;
  }

  // Method untuk menambah kota baru
  Future<Map<String, dynamic>> addKota(String token, String namaKota) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/kota'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: {
        'nama_kota': namaKota,
      },
    );
    return jsonDecode(response.body);
  }

 Future<List<Kota>> getKotas() async {
    final response = await http.get(Uri.parse('$_baseUrl/kota'));
    if (response.statusCode == 200) {
      // PERBAIKAN: Ambil dari kunci 'data' jika API Anda menggunakan Resource Collection
      // Jika API Anda langsung mengembalikan array, hapus Map dan ambil langsung.
      // Kita asumsikan API Anda konsisten menggunakan Resource Collection
      Map<String, dynamic> jsonObject = jsonDecode(response.body);
      List jsonResponse = jsonObject['data'];
      return jsonResponse.map((kota) => Kota.fromJson(kota)).toList();
    } else {
      throw Exception('Gagal memuat data kota');
    }
  }

  /// Mengambil daftar semua kategori dari API
  Future<List<Kategori>> getKategoris() async {
    final response = await http.get(Uri.parse('$_baseUrl/kategori'));
    if (response.statusCode == 200) {
      // PERBAIKAN: Lakukan hal yang sama untuk kategori
      Map<String, dynamic> jsonObject = jsonDecode(response.body);
      List jsonResponse = jsonObject['data'];
      return jsonResponse.map((kategori) => Kategori.fromJson(kategori)).toList();
    } else {
      throw Exception('Gagal memuat data kategori');
    }
  }
}
