import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelpView extends StatelessWidget {
  const HelpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Help Page',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
