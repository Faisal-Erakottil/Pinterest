import 'package:flutter/material.dart';

Widget buildOption(IconData icon, String label) {
  return Column(
    children: [
      Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: Colors.white, size: 30),
      ),
      const SizedBox(height: 8),
      Text(label, style: const TextStyle(color: Colors.white)),
    ],
  );
}
