import 'package:flutter/material.dart';
import 'package:phantom_clone/views/widgets/navbar_widget.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Swap'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.list_outlined)),
        ],
      ),
      body: Center(child: Text('Explore page')),
      bottomNavigationBar: NavbarWidget(),
    );
  }
}
