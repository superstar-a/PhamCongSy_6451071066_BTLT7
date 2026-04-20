import 'package:flutter/material.dart';
import '../models/news.dart';

class NewsTile extends StatelessWidget {
  final News news;
  const NewsTile({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue.shade100,
                  child: Text('${news.id}'),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(news.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(news.body, style: const TextStyle(color: Colors.black87)),
          ],
        ),
      ),
    );
  }
}
