class News {
  final int id;
  final String title;
  final String body;

  News({required this.id, required this.title, required this.body});

  factory News.fromJson(Map<String, dynamic> json) => News(
        id: json['id'] ?? 0,
        title: json['title'] ?? '',
        body: json['body'] ?? '',
      );
}
