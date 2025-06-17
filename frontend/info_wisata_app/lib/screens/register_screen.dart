import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmationController = TextEditingController();
  bool _isLoading = false;

  Future<void> _register() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _isLoading = true);
      
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      final success = await authProvider.register(
        _nameController.text,
        _emailController.text,
        _passwordController.text,
        _passwordConfirmationController.text
      );

      setState(() => _isLoading = false);

      if (mounted && !success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(authProvider.errorMessage),
            backgroundColor: Colors.red,
          ),
        );
      }
      if (success && mounted) {
        Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Akun Baru')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(controller: _nameController, decoration: const InputDecoration(labelText: 'Nama Lengkap'), validator: (v) => v!.isEmpty ? 'Nama tidak boleh kosong' : null),
              const SizedBox(height: 10),
              TextFormField(controller: _emailController, decoration: const InputDecoration(labelText: 'Email'), validator: (v) => v!.isEmpty ? 'Email tidak boleh kosong' : null),
              const SizedBox(height: 10),
              TextFormField(controller: _passwordController, decoration: const InputDecoration(labelText: 'Password'), obscureText: true, validator: (v) => v!.isEmpty ? 'Password tidak boleh kosong' : null),
              const SizedBox(height: 10),
              TextFormField(controller: _passwordConfirmationController, decoration: const InputDecoration(labelText: 'Konfirmasi Password'), obscureText: true, validator: (v) {
                if(v!.isEmpty) return 'Konfirmasi password tidak boleh kosong';
                if(v != _passwordController.text) return 'Password tidak cocok';
                return null;
              }),
              const SizedBox(height: 20),
              _isLoading ? const Center(child: CircularProgressIndicator()) : ElevatedButton(onPressed: _register, child: const Text('Daftar')),
            ],
          ),
        ),
      ),
    );
  }
}