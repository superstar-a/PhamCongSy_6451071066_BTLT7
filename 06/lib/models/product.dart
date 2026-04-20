class Product {
  final int id;
  final String title;
  final num price;
  final String thumbnail;
  final String brand;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.thumbnail,
    required this.brand,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'] ?? 0,
        title: json['title'] ?? '',
        price: json['price'] ?? 0,
        thumbnail: json['thumbnail'] ?? '',
        brand: json['brand'] ?? '',
      );
}
