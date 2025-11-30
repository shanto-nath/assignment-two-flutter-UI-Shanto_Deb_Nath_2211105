import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffe0f7fa), // Light blue pastel background
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Text(
            "Shanto is too Lazy to Code For This Page",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xff004d40), // Dark teal for text
            ),
          ),
        ),
      ),
    );
  }
}