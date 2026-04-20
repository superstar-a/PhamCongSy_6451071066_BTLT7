import 'package:flutter/material.dart';
import '../views/edit_user_view.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bai 4 - Update User',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.orange, useMaterial3: true),
      home: const EditUserView(userId: 1),
    );
  }
}
