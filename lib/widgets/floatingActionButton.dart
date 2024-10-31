import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final Function() onPressed;
  final String iconPath; // Path for the custom icon

  CustomFloatingActionButton({required this.onPressed, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.white,
      onPressed: onPressed,
      child: Image.asset(
        iconPath,
        width: 24, // Customize the size of the icon if needed
        height: 24,
      ),
    );
  }
}
