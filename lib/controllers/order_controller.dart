import '../models/order_model.dart';

class OrderController {
  List<Order> orders = [
    Order(
      productName: "Bomber Jackets",
      brand: "Hugo Boss",
      size: "M",
      price: 49.99,
      imageUrl: "assets/jacket1.png",
    ),
    Order(
      productName: "Bomber Jackets",
      brand: "Hugo Boss",
      size: "M",
      price: 49.99,
      imageUrl: "assets/jacket2.png",
    ),
    Order(
      productName: "Bomber Jackets",
      brand: "Hugo Boss",
      size: "XL",
      price: 49.99,
      imageUrl: "assets/jacket3.png",
    ),
    Order(
      productName: "Bomber Jackets",
      brand: "Hugo Boss",
      size: "XL",
      price: 49.99,
      imageUrl: "assets/jacket3.png",
    ),
    Order(
      productName: "Bomber Jackets",
      brand: "Hugo Boss",
      size: "XL",
      price: 49.99,
      imageUrl: "assets/jacket3.png",
    ),
  ];

  // Retrieve orders
  List<Order> getOrderHistory() {
    return orders;
  }
}
