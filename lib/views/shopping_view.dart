import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/bottomNavBar.dart';

class ShoppingView extends StatelessWidget {
  const ShoppingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('Cart'),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomFloatingActionButton(
        onPressed: () {},
        iconPath: 'assets/fab.png',
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 3),
    );
  }
}
