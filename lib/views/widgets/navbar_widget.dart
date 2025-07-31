import 'package:flutter/material.dart';
import 'package:phantom_clone/data/notifier.dart';

class NavbarWidget extends StatefulWidget {
  const NavbarWidget({super.key});

  @override
  State<NavbarWidget> createState() => _NavbarWidgetState();
}

class _NavbarWidgetState extends State<NavbarWidget> {
  void _onSelectNav(int index) {
    setState(() {
      selectedNav.value = index;
      selectedPage.value = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedNav,
      builder: (context, value, child) {
        return BottomNavigationBar(
          fixedColor: Colors.deepPurple,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: value,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.repeat), label: 'Swap'),
            BottomNavigationBarItem(
              icon: Icon(Icons.access_time),
              label: 'Transacsion',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Transacsion',
            ),
          ],
          onTap: _onSelectNav,
        );
      },
    );
  }
}
