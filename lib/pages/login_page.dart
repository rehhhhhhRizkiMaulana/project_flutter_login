
import 'package:flutter/material.dart';

import '../widgets/header_login.dart';
import '../widgets/input_field.dart';
import '../widgets/tombol_utama.dart';
import '../services/session_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController =
  TextEditingController();

  final TextEditingController _passwordController =
  TextEditingController();

  bool _sembunyikanPassword = true;

  // Fungsi login
  Future<void> _login() async {
    String username = _usernameController.text.trim();
    String password = _passwordController.text;

    // Memeriksa input kosong
    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Username dan password harus diisi!'),
        ),
      );
      return;
    }

    // Menyimpan sesi login
    await SessionService.saveSession(username);

    if (!mounted) return;

    // Masuk ke halaman utama
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text('Halaman Login'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Card(
            elevation: 3,
            color: Colors.white,

            child: Padding(
              padding: const EdgeInsets.all(20),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const HeaderLogin(
                    title: 'Silakan Login',
                  ),

                  const SizedBox(height: 25),

                  // Input Username
                  InputField(
                    controller: _usernameController,
                    hint: 'Masukkan Username',
                    icon: Icons.person,
                    isPassword: false,
                  ),

                  const SizedBox(height: 15),

                  // Input Password
                  InputField(
                    controller: _passwordController,
                    hint: 'Masukkan Password',
                    icon: Icons.lock,
                    isPassword: true,
                    obscureText: _sembunyikanPassword,
                    onTogglePassword: () {
                      setState(() {
                        _sembunyikanPassword =
                        !_sembunyikanPassword;
                      });
                    },
                  ),

                  const SizedBox(height: 25),

                  // Tombol Login
                  TombolUtama(
                    label: 'LOGIN',
                    onPressed: _login,
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    'Aplikasi Login Flutter',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
