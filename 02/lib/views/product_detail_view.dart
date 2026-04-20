import 'package:flutter/material.dart';
import '../controller/product_controller.dart';
import '../models/product.dart';
import '../widget/info_row.dart';
import '../widget/mssv_banner.dart';

class ProductDetailView extends StatefulWidget {
  final int productId;
  const ProductDetailView({super.key, required this.productId});

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  late Future<Product> _future;
  final _controller = ProductController();

  @override
  void initState() {
    super.initState();
    _future = _controller.fetchProduct(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bai 2 - Product Detail'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const MssvBanner(),
          Expanded(
            child: FutureBuilder<Product>(
              future: _future,
              builder: (context, snap) {
                if (snap.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snap.hasError) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text('Loi: ${snap.error}',
                          style: const TextStyle(color: Colors.red)),
                    ),
                  );
                }
                final p = snap.data!;
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (p.thumbnail.isNotEmpty)
                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(p.thumbnail,
                                height: 220, fit: BoxFit.cover),
                          ),
                        ),
                      const SizedBox(height: 16),
                      Text(p.title,
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Text('\$${p.price}',
                          style: const TextStyle(
                              fontSize: 20, color: Colors.red)),
                      const Divider(height: 32),
                      InfoRow(label: 'ID', value: '${p.id}'),
                      InfoRow(label: 'Brand', value: p.brand),
                      InfoRow(label: 'Description', value: p.description),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
