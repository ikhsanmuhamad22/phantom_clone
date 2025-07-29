import 'package:flutter/material.dart';

class CardInfoWidget extends StatelessWidget {
  const CardInfoWidget({
    super.key,
    required this.icon,
    required this.desc,
    this.close,
  });

  final IconData icon;
  final String desc;
  final bool? close;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 70,
        width: 350,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(flex: 2, child: Icon(icon, color: Colors.deepPurple)),
            Expanded(
              flex: 6,
              child: Text(desc, style: TextStyle(fontSize: 14)),
            ),
            if (close == true)
              (Expanded(
                flex: 1,
                child: Icon(Icons.close, size: 20, color: Colors.white54),
              )),
          ],
        ),
      ),
    );
  }
}
