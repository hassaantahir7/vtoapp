import 'package:flutter/material.dart';
import 'package:shop/views/favorites_view.dart';
import 'package:shop/views/home_view.dart';
import 'package:shop/views/shopping_view.dart';
import 'package:shop/views/profile_view.dart';
import '../views/cart_view.dart';

class BottomNavBar extends StatefulWidget {
  int currentIndex = 0;

  BottomNavBar({required this.currentIndex});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeView()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FavoritesView()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CartView()),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileView()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent, // Set the color to transparent
      elevation: 0, // Remove any shadow or elevation
      shape: CircularNotchedRectangle(),
      notchMargin: 8.0,
      clipBehavior: Clip.antiAlias,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem('assets/home.png', 0),
            _buildNavItem('assets/heartNav.png', 1),
            SizedBox(width: 40), // Spacing for the floating button
            _buildNavItem('assets/bag.png', 3),
            _buildNavItem('assets/profileIcon.png', 4),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(String iconPath, int index) {
    bool isSelected = widget.currentIndex == index;
    return IconButton(
      icon: Image.asset(
        iconPath,
        color: isSelected ? Colors.black : Colors.grey,
        width: 24,
        height: 24,
      ),
      onPressed: () => _onItemTapped(index),
    );
  }
}

class CustomFloatingActionButton extends StatelessWidget {
  final Function() onPressed;
  final String iconPath; // Path for the custom icon

  CustomFloatingActionButton({required this.onPressed, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: FloatingActionButton(
        backgroundColor: Colors.transparent,
        elevation: 0,
        onPressed: onPressed,
        child: Image.asset(
          iconPath,
          width: 30,
          height: 30,
        ),
      ),
    );
  }
}
