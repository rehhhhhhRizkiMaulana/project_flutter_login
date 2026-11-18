
import 'package:flutter/material.dart';

import '../widgets/header_login.dart';
import '../widgets/input_field.dart';
import '../widgets/tombol_utama.dart';
import '../widgets/kartu_hasil_login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _username = '';
  String _password = '';

  final TextEditingController _usernameController =
  TextEditingController();

  final TextEditingController _passwordController =
  TextEditingController();

  bool _tampilkanHasil = false;

  // Mengatur password tersembunyi atau terlihat
  bool _sembunyikanPassword = true;

  void _login() {
    setState(() {
      _username = _usernameController.text;
      _password = _passwordController.text;
      _tampilkanHasil = true;
    });
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
      appBar: AppBar(
        title: const Text('Halaman Login'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const HeaderLogin(
                title: 'Silakan Login',
              ),

              const SizedBox(height: 25),

              InputField(
                controller: _usernameController,
                hint: 'Masukkan Username',
                icon: Icons.person,
              ),

              const SizedBox(height: 15),

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

              const SizedBox(height: 20),

              TombolUtama(
                label: 'Login',
                onPressed: _login,
              ),

              const SizedBox(height: 25),

              if (_tampilkanHasil)
                KartuHasilLogin(
                  username: _username,
                  password: _password,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
