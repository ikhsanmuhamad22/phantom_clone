import 'package:flutter/material.dart';
import 'package:phantom_clone/views/widgets/navbar_widget.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.list_outlined)),
        ],
      ),
      body: Center(child: Text('No History Found')),
      bottomNavigationBar: NavbarWidget(),
    );
  }
}
