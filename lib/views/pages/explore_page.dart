import 'package:flutter/material.dart';
import 'package:phantom_clone/views/widgets/navbar_widget.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Explore')),
      body: Center(child: Text('This Feature Still prosess')),
      bottomNavigationBar: NavbarWidget(),
    );
  }
}
