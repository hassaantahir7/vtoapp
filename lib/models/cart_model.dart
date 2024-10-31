class CartItem {
  final String name;
  final String imageUrl;
  final String brand;
  final String size;
  final double price;
  int quantity;

  CartItem({
    required this.name,
    required this.imageUrl,
    required this.brand,
    required this.size,
    required this.price,
    this.quantity = 1,
  });
}
