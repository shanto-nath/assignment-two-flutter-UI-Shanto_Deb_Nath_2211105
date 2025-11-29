import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Import all page files based on your directory structure
import 'Pages/page_1.dart';
import 'Pages/page_2.dart';
import 'Pages/page_3.dart';
import 'Pages/page_4.dart';

// --- Global Constants (Exported for use in page files) ---
const Color primaryColor = Color(0xFF673AB7); // Deep Purple
const Color secondaryColor = Color(0xFF9C27B0); // Lighter Purple
const Color accentColor = Color(0xFF42A5F5); // Blue for indicators
const Color cardColor = Color(0xFF5E35B1); // Slightly lighter card for contrast

const String studentName = "Gemini AI";
const String studentId = "S9999999";
const String studentEmail = "gemini.ai@google.com";
const String studentBio = "I'm currently focused on enhancing large language models to provide world-class assistance. I believe clear, structured, and compliant code is the key to excellent digital tools. My current passion project is exploring generative UI design.";

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banking App UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 8,
        ),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}

// --- Main Navigation Structure (Matching user's example) ---
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          Page1Content(), // Home Page (Previously HomePage)
          Page2Content(), // Reports Page (Previously ReportsPage)
          Page3Content(), // Cards Placeholder Page
          Page4Content(), // Profile Page (Previously ProfilePage)
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (i) {
          setState(() => _currentIndex = i);
          _pageController.jumpToPage(i);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment_outlined),
            activeIcon: Icon(Icons.assessment),
            label: "Reports",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card_outlined), // Reinstated the Cards icon
            activeIcon: Icon(Icons.credit_card),
            label: "Cards",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}