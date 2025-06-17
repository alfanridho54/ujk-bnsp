import 'package:flutter/material.dart';
import 'package:info_wisata_app/providers/auth_provider.dart';
import 'package:info_wisata_app/screens/login_screen.dart';
import 'package:provider/provider.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: MaterialApp(
        title: 'Info Wisata',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Consumer<AuthProvider>(
        builder: (context, auth, child) {
          return auth.isAuthenticated ? const MainScreen() : const LoginScreen();
        },
        ),
      ),
    );
  }
}