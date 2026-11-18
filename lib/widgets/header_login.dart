
import 'package:flutter/material.dart';

class HeaderLogin extends StatelessWidget {
  final String title;

  const HeaderLogin({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(
          Icons.account_circle,
          size: 80,
          color: Colors.blue,
        ),
        const SizedBox(height: 10),
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
