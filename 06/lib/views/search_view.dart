import 'dart:async';
import 'package:flutter/material.dart';
import '../controller/search_controller.dart';
import '../models/product.dart';
import '../widget/mssv_banner.dart';
import '../widget/product_tile.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});
  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final _ctrl = TextEditingController();
  final _api = SearchApiController();
  Timer? _debounce;
  List<Product> _results = [];
  bool _loading = false;
  String _lastKeyword = '';

  void _onChanged(String v) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () => _search(v));
  }

  Future<void> _search(String q) async {
    if (q.trim().isEmpty) {
      setState(() {
        _results = [];
        _lastKeyword = '';
      });
      return;
    }
    setState(() {
      _loading = true;
      _lastKeyword = q;
    });
    try {
      final list = await _api.search(q.trim());
      setState(() {
        _results = list;
        _loading = false;
      });
    } catch (e) {
      setState(() => _loading = false);
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Loi: $e')));
      }
    }
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bai 6 - Search Products'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const MssvBanner(),
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: _ctrl,
              onChanged: _onChanged,
              onSubmitted: _search,
              decoration: InputDecoration(
                hintText: 'Nhap tu khoa (vd: phone, laptop...)',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _ctrl.text.isEmpty
                    ? null
                    : IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _ctrl.clear();
                          _search('');
                          setState(() {});
                        },
                      ),
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          if (_loading) const LinearProgressIndicator(),
          Expanded(
            child: _results.isEmpty
                ? Center(
                    child: Text(_lastKeyword.isEmpty
                        ? 'Nhap tu khoa de tim kiem'
                        : 'Khong co ket qua'),
                  )
                : ListView.builder(
                    itemCount: _results.length,
                    itemBuilder: (_, i) => ProductTile(product: _results[i]),
                  ),
          ),
        ],
      ),
    );
  }
}
