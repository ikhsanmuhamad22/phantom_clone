import 'package:flutter/material.dart';

class PricePnlWidget extends StatelessWidget {
  const PricePnlWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '\$184.99',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '-\$5.99',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w800,
                color: Colors.red,
              ),
            ),
            SizedBox(width: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 86, 38, 38),
                borderRadius: BorderRadius.circular(5), // Rounded corners
              ),
              child: Text(
                '-3.53%',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
