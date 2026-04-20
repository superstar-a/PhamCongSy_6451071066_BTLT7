import 'package:flutter/material.dart';
import '../controller/news_controller.dart';
import '../models/news.dart';
import '../widget/mssv_banner.dart';
import '../widget/news_tile.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key});
  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  final _controller = NewsController();
  List<News> _items = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final list = await _controller.fetchNews();
      if (!mounted) return;
      setState(() {
        _items = list;
        _loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() => _loading = false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Loi: $e')));
    }
  }

  Future<void> _refresh() async {
    await _load();
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Da refresh du lieu'),
          duration: Duration(seconds: 1),
          backgroundColor: Colors.blue,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bai 7 - Pull to Refresh'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const MssvBanner(),
          Expanded(
            child: _loading
                ? const Center(child: CircularProgressIndicator())
                : RefreshIndicator(
                    onRefresh: _refresh,
                    child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: _items.length,
                      itemBuilder: (_, i) => NewsTile(news: _items[i]),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
