class AppInfo {
  static const String mssv = '6451071066';
  static const String hoTen = 'Pham Cong Sy';
  static const String banner = 'MSSV: $mssv - $hoTen';
}

class ApiEndpoints {
  static const String baseUrl = 'https://dummyjson.com';
  static String product(int id) => '$baseUrl/products/$id';
}
