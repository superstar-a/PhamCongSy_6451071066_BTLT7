import 'package:flutter/material.dart';
import '../views/product_detail_view.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bai 2 - Product Detail',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.teal, useMaterial3: true),
      home: const ProductDetailView(productId: 1),
    );
  }
}
