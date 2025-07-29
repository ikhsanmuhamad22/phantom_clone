import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key, required this.icon, required this.label});

  final IconData? icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: 80,
        height: 80,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.deepPurple),
            Text(label, style: TextStyle(color: Colors.white60, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
