import 'package:flutter/material.dart';

import 'screens/add_pet_screen.dart';
import 'screens/forgot_password_screen.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  static const String routeHome = '/';
  static const String routeLogin = '/login';
  static const String routeForgotPassword = '/forgot-password';
  static const String routeAddPet = '/add-pet';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Adota Rec',
      home: const HomePage(),
      routes: {
        routeHome: (_) => const HomePage(),
        routeLogin: (_) => const LoginScreen(),
        routeForgotPassword: (_) => const ForgotPasswordScreen(),
        routeAddPet: (_) => const AddPetScreen(),
      },
    );
  }
}
