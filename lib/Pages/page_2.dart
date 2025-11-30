import 'package:flutter/material.dart';
class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryVibrant = Color(0xff7f00ff); // Vibrant Purple
    const Color backgroundLight = Color(0xfff7f7f7); // Light Gray Background

    return Scaffold(
      backgroundColor: backgroundLight,
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
                        backgroundColor: primaryVibrant,
                        child:
                        Text("SDN", style: TextStyle(color: Colors.white)),
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

              Text(
                "Monthly Spending Report",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black87),
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
                          color: Color(0xffe53935), 
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

              _category("Food & Drink", 450, const Color(0xffef5350), "35%"), 
              _category("Shopping", 320, const Color(0xff42a5f5), "25%"), 
              _category("Housing", 280, const Color(0xffffca28), "22%"), 
              _category("Transport", 150, const Color(0xff66bb6a), "12%"), 
              _category("Other", 70, Colors.grey, "6%"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _category(
      String title, double amount, Color color, String percent) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontWeight: FontWeight.w600, fontSize: 16),
              ),
     
              Text(
                "\$${amount.toStringAsFixed(2)} ($percent)",
                style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 6),
          
          LinearProgressIndicator(
            value: amount / 1300,
            backgroundColor: const Color(0xffe0e0e0), 
            color: color,
            minHeight: 6,
          ),
        ],
      ),
    );
  }
}