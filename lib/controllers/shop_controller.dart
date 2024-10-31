import '../models/product_model.dart';
import '../models/shop_model.dart';

class ShopController {
  // Dummy product list, you can later fetch this from an API or database
  final List<Product> products = [
    Product(
      name: 'Texture Red T-Shirt',
      imagePath: 'assets/item1.png',
      price: '20 AED',
    ),
    Product(
      name: 'Bomber Jackets',
      imagePath: 'assets/item2.png',
      price: '\$49.99',
    ),
    Product(
      name: 'Grey Hoodie',
      price: '48.00 AED',
      imagePath: 'assets/onboarding3.png',
    ),
  ];

  // Selected product details
  final Product productDetails = Product(
    brand: 'Hugo Boss',
    name: 'Grey Hoodie',
    price: '48.00 AED',
    rating: 4.5,
    reviews: 67,
    description:
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry...',
    sizes: ['S', 'M', 'L', 'XL'],
    imagePath: 'assets/onboarding2.png',
  );

  int quantity = 1;

  // Fetch list of products
  List<Product> getProducts() {
    return products;
  }

  // Fetch selected product details
  Product getProductDetails() {
    return productDetails;
  }

  // Increment product quantity
  void incrementQuantity() {
    quantity++;
  }

  // Decrement product quantity
  void decrementQuantity() {
    if (quantity > 1) {
      quantity--;
    }
  }

  // Get current product quantity
  int getQuantity() {
    return quantity;
  }
}
