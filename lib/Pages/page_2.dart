import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff7f7f7), // Light gray background
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundColor: Color(0xff7f00ff), // Vibrant purple
                        child:
                        Text("S", style: TextStyle(color: Colors.white)),
                      ),
                      const SizedBox(width: 10),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Welcome back,",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.black54)),
                          Text(
                            "Shanto Deb Nath",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Icon(Icons.notifications_none, size: 28),
                ],
              ),

              const SizedBox(height: 20),

              const Text(
                "Monthly Spending Report",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xff7f00ff)), // Vibrant color for title
              ),

              const SizedBox(height: 20),

              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20), // More rounded corners
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2), // Lighter, subtle shadow
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Total Expenses (Last 30 days)",
                        style: TextStyle(color: Colors.black54)),
                    SizedBox(height: 6),
                    Text(
                      "-\$1270.00",
                      style: TextStyle(
                          color: Color(0xffe53935), // Updated red for high contrast
                          fontSize: 34,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(Icons.arrow_upward,
                            color: Color(0xffe53935), size: 18),
                        SizedBox(width: 4),
                        Text("Up 12% from last month",
                            style: TextStyle(color: Color(0xffe53935))),
                      ],
                    )
                  ],
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                "Spending Breakdown",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              _category("Food & Drink", 450, const Color(0xffef5350), "35%"), // Pastel/Vibrant red
              _category("Shopping", 320, const Color(0xff42a5f5), "25%"), // Pastel/Vibrant blue
              _category("Housing", 280, const Color(0xffffca28), "22%"), // Vibrant yellow
              _category("Transport", 150, const Color(0xff66bb6a), "12%"), // Pastel/Vibrant green
              _category("Other", 70, Colors.grey, "6%"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _category(
      String title, double amount, Color color, String percent) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(16), // Slightly more padding
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.15), // Lighter, subtle shadow
              blurRadius: 10,
              offset: const Offset(0, 5))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  fontWeight: FontWeight.w600, fontSize: 18)), // Slightly larger font
          const SizedBox(height: 12),

          LinearProgressIndicator(
            value: amount / 1300,
            backgroundColor: const Color(0xffe0e0e0), // Lighter progress background
            color: color,
            minHeight: 8, // Thicker progress bar
          ),
          const SizedBox(height: 12),

          Text("\$${amount.toStringAsFixed(2)} ($percent)",
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black87)),
        ],
      ),
    );
  }
}