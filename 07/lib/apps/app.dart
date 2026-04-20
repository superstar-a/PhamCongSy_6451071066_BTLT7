import 'package:flutter/material.dart';
import '../views/news_view.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bai 7 - Pull to Refresh',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.blue, useMaterial3: true),
      home: const NewsView(),
    );
  }
}
