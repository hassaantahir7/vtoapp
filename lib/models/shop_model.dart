import 'dart:ui';

class Product {
  final String brand;
  final String name;
  final String price;
  final double rating;
  final int reviews;
  final String description;
  final List<String> sizes;
  final List<Color> colors;
  final String imagePath;

  Product({
    this.brand = '',
    required this.name,
    required this.price,
    this.rating = 0.0,
    this.reviews = 0,
    this.description = '',
    this.sizes = const [],
    this.colors = const [],
    required this.imagePath,
  });
}
