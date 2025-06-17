import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../services/api_service.dart';

class AuthProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  String? _token;
  bool _isAuthenticated = false;
  String _errorMessage = '';

  String? get token => _token;
  bool get isAuthenticated => _isAuthenticated;
  String get errorMessage => _errorMessage;

  AuthProvider() {
    _initAuth();
  }

  Future<void> _initAuth() async {
    _token = await _storage.read(key: 'auth_token');
    if (_token != null) {
      _isAuthenticated = true;
    }
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    try {
      final response = await _apiService.login(email, password);
      
      // Cek apakah login dari API berhasil
      if (response['status'] == true && response['token'] != null) {
        _token = response['token'];
        _isAuthenticated = true;
        await _storage.write(key: 'auth_token', value: _token);
        _errorMessage = ''; // Hapus pesan error jika sukses
        notifyListeners();
        return true;
      } else {
        // Tangkap pesan error dari API
        _errorMessage = response['message'] ?? 'Email atau Password salah';
        notifyListeners();
        return false;
      }
    } catch (e) {
      _errorMessage = 'Terjadi kesalahan pada koneksi.';
      notifyListeners();
      return false;
    }
  }

  Future<bool> register(String name, String email, String password, String passwordConfirmation) async {
    try {
      final response = await _apiService.register(name, email, password, passwordConfirmation);
      // Langsung panggil method login jika registrasi sukses
      if (response.containsKey('data') && response['data']['token'] != null) {
        return await login(email, password);
      } else {
        _errorMessage = response['message'] ?? 'Registrasi gagal.';
        notifyListeners();
        return false;
      }
    } catch (e) {
      _errorMessage = 'Terjadi kesalahan pada koneksi.';
      notifyListeners();
      return false;
    }
  }

  Future<void> logout() async {
    // Di sini bisa ditambahkan pemanggilan API /logout jika diperlukan
    _token = null;
    _isAuthenticated = false;
    await _storage.delete(key: 'auth_token');
    notifyListeners();
  }
}