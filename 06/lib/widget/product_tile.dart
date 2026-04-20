import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        leading: product.thumbnail.isNotEmpty
            ? Image.network(product.thumbnail,
                width: 56, height: 56, fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const Icon(Icons.image))
            : const Icon(Icons.image),
        title: Text(product.title,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(product.brand),
        trailing: Text('\$${product.price}',
            style: const TextStyle(color: Colors.red)),
      ),
    );
  }
}
