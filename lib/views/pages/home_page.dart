import 'package:flutter/material.dart';
import 'package:phantom_clone/views/widgets/navbar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.account_circle, size: 35),
            SizedBox(width: 8),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '@mikhsann',
                  style: TextStyle(fontSize: 12, color: Colors.white38),
                ),
                Text('Account 1', style: TextStyle(fontSize: 22)),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.qr_code_scanner_rounded),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        ],
      ),
      body: Column(),
      bottomNavigationBar: NavbarWidget(),
    );
  }
}
