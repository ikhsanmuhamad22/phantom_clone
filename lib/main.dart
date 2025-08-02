import 'package:flutter/material.dart';
import 'package:phantom_clone/data/notifier.dart';
import 'package:phantom_clone/data/provider/crypto_provider.dart';
import 'package:phantom_clone/views/pages/explore_page.dart';
import 'package:phantom_clone/views/pages/history_page.dart';
import 'package:phantom_clone/views/pages/home_page.dart';
import 'package:phantom_clone/views/pages/swap_page.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => CryptoProvider())],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        bottomSheetTheme: BottomSheetThemeData(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
    );
  }
}

List<Widget> pages = [HomePage(), SwapPage(), HistoryPage(), ExplorePage()];

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPage,
      builder: (context, value, child) {
        return pages.elementAt(value);
      },
    );
  }
}
