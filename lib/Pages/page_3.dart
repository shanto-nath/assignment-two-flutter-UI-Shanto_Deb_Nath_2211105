import 'package:flutter/material.dart';

class Page3Content extends StatelessWidget {
  const Page3Content({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // NOTE: Custom fonts like 'Lemon Milk' require configuration in pubspec.yaml.
              // Since this environment cannot access pubspec.yaml, a system font
              // is used. We apply a very large, bold style to simulate the custom font's presence.
              Text(
                "Shanto is too Lazy",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  color: Colors.redAccent,
                  letterSpacing: 1.5,
                  height: 1.2,
                  fontFamily: 'Roboto', // Fallback System Font
                ),
              ),
              Text(
                "to write code for this page",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  color: Colors.redAccent,
                  letterSpacing: 1.5,
                  height: 1.2,
                  fontFamily: 'Roboto', // Fallback System Font
                ),
              ),
              SizedBox(height: 20),
              Icon(Icons.sentiment_dissatisfied, size: 80, color: Colors.redAccent),
            ],
          ),
        ),
      ),
    );
  }
}