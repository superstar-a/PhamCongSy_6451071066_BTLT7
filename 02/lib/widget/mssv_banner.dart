import 'package:flutter/material.dart';
import '../utils/constants.dart';

class MssvBanner extends StatelessWidget {
  const MssvBanner({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.amber.shade200,
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: Text(
        AppInfo.banner,
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      ),
    );
  }
}
