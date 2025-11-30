import 'package:flutter/material.dart';

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff7f7f7), // Very light gray background
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Welcome back,\nOhi Yea Siam",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            const Text(
              "User Profile",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xff7f00ff)), // Vibrant color for title
            ),

            const SizedBox(height: 25),

            CircleAvatar(
              radius: 50,
              backgroundColor: const Color(0xff7f00ff), // Vibrant purple
              child: const Text(
                "OS",
                style: TextStyle(color: Colors.white, fontSize: 32, fontFamily: 'Montserrat'),
              ),
            ),

            const SizedBox(height: 35),

            buildInfoCard("Name", "Ohi Yea Siam"),
            const SizedBox(height: 15),
            buildInfoCard("Student ID", "2211047"),
            const SizedBox(height: 15),
            buildInfoCard("Email", "2211047@iub.edu.bd"),
            const SizedBox(height: 20),

            buildBioCard(),
          ],
        ),
      ),
    );
  }

  Widget buildInfoCard(String title, String value) {
    return Container(
      padding: const EdgeInsets.all(18),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20), // More rounded corners
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2), // Lighter, subtle shadow
              blurRadius: 15,
              offset: const Offset(0, 8)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
              const TextStyle(fontSize: 14, color: Colors.black54)),
          const SizedBox(height: 6),
          Text(value,
              style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget buildBioCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20), // More rounded corners
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2), // Lighter, subtle shadow
              blurRadius: 15,
              offset: const Offset(0, 8)),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Bio / Story",
              style: TextStyle(fontSize: 14, color: Colors.black54)),
          SizedBox(height: 10),
          Text(
            "\"I'm currently focusing on my final year, balancing studies with building side projects. I believe financial health is key to academic success!\"",
            style: TextStyle(fontSize: 16, height: 1.4),
          ),
        ],
      ),
    );
  }
}