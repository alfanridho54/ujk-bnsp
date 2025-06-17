import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../services/api_service.dart';

class AddCityScreen extends StatefulWidget {
  const AddCityScreen({super.key});

  @override
  _AddCityScreenState createState() => _AddCityScreenState();
}

class _AddCityScreenState extends State<AddCityScreen> {
  final _formKey = GlobalKey<FormState>();
  final _namaKotaController = TextEditingController();
  final ApiService _apiService = ApiService();
  bool _isLoading = false;

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    setState(() => _isLoading = true);

    final token = Provider.of<AuthProvider>(context, listen: false).token;
    if (token == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Anda harus login untuk melakukan aksi ini.')),
      );
      setState(() => _isLoading = false);
      return;
    }

    try {
      final result = await _apiService.addKota(token, _namaKotaController.text);
      
      if (mounted) {
        final bool isSuccess = result['success'] as bool? ?? false;
        final String message = result['message'] as String? ?? 'Terjadi kesalahan.';

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
            backgroundColor: isSuccess ? Colors.green : Colors.red,
          ),
        );

        if (isSuccess) {
          Navigator.of(context).pop(); // Kembali ke halaman sebelumnya jika sukses
        }
      }
    } catch (e) {
      if(mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}'), backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Kota Baru'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _namaKotaController,
                decoration: const InputDecoration(
                  labelText: 'Nama Kota',
                  border: OutlineInputBorder(),
                  hintText: 'Contoh: Surabaya',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama kota tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24.0),
              _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      onPressed: _submit,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16.0)
                      ),
                      child: const Text('Simpan Kota'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
