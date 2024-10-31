import '../models/cart_model.dart';

class CartController {
  List<CartItem> _cartItems = [
    CartItem(
      name: 'Bomber Jackets',
      imageUrl: 'assets/jacket1.png',
      brand: 'Hugo Boss',
      size: 'M',
      price: 49.99,
    ),
    CartItem(
      name: 'Bomber Jackets',
      imageUrl: 'assets/jacket2.png',
      brand: 'Hugo Boss',
      size: 'M',
      price: 49.99,
    ),
    CartItem(
      name: 'Bomber Jackets',
      imageUrl: 'assets/jacket3.png',
      brand: 'Hugo Boss',
      size: 'XL',
      price: 49.99,
    ),
  ];

  List<CartItem> getCartItems() {
    return _cartItems;
  }

  void increaseQuantity(int index) {
    _cartItems[index].quantity++;
  }

  void decreaseQuantity(int index) {
    if (_cartItems[index].quantity > 1) {
      _cartItems[index].quantity--;
    }
  }

  double getSubtotal() {
    return _cartItems.fold(
      0.0,
      (sum, item) => sum + (item.price * item.quantity),
    );
  }

  double getShippingCost() {
    return 5.00; // Flat rate shipping
  }

  double getTotal() {
    return getSubtotal() + getShippingCost();
  }
}
