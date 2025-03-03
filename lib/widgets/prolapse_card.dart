import 'package:flutter/material.dart';
class ProlapseCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;

  const ProlapseCard({
    required this.title,
    required this.value,
    required this.subtitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Text(subtitle, style: const TextStyle(fontSize: 14, color: Colors.grey)),
        ],
      ),
    );
  }
}