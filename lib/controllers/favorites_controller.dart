import '../models/favorite_item.dart';

class FavoritesController {
  List<FavoriteItem> _favorites = [
    FavoriteItem(
      title: 'Bomber Jackets',
      subtitle: 'Hugo Boss',
      size: 'M',
      price: '\$49.99',
      imageUrl: 'assets/jacket1.png', // Replace with actual image path
    ),
    FavoriteItem(
      title: 'Bomber Jackets',
      subtitle: 'Hugo Boss',
      size: 'M',
      price: '\$49.99',
      imageUrl: 'assets/jacket2.png', // Replace with actual image path
    ),
    FavoriteItem(
      title: 'Bomber Jackets',
      subtitle: 'Hugo Boss',
      size: 'XL',
      price: '\$49.99',
      imageUrl: 'assets/jacket3.png', // Replace with actual image path
    ),
    FavoriteItem(
      title: 'Bomber Jackets',
      subtitle: 'Hugo Boss',
      size: 'XL',
      price: '\$49.99',
      imageUrl: 'assets/jacket3.png', // Replace with actual image path
    ),
    FavoriteItem(
      title: 'Bomber Jackets',
      subtitle: 'Hugo Boss',
      size: 'XL',
      price: '\$49.99',
      imageUrl: 'assets/jacket3.png', // Replace with actual image path
    ),
  ];

  List<FavoriteItem> getFavorites() {
    return _favorites;
  }
}
