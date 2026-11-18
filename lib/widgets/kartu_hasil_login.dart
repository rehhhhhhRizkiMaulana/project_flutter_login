
import 'package:flutter/material.dart';

class KartuHasilLogin extends StatelessWidget {
  final String username;
  final String password;

  const KartuHasilLogin({
    super.key,
    required this.username,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hasil Login',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text('Username: $username'),
            Text('Password: $password'),
          ],
        ),
      ),
    );
  }
}
