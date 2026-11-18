
import 'package:flutter/material.dart';
import '../widgets/input_field.dart';
import '../widgets/tombol_utama.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _nama = '';

  final TextEditingController _namaController =
  TextEditingController();

  void _gantiNama() {
    setState(() {
      _nama = _namaController.text;
    });
  }

  @override
  void dispose() {
    _namaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Home Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            InputField(
              controller: _namaController,
              hint: 'Masukkan Nama Baru',
              icon: Icons.person,
            ),

            const SizedBox(height: 15),

            TombolUtama(
              label: 'Ganti Nama',
              onPressed: _gantiNama,
            ),

            const SizedBox(height: 20),

            Text(
              'Nama Saya: $_nama',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
