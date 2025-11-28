import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// --- User Information ---
const String studentName = "Gemini AI";
const String studentId = "S9999999";
const String studentEmail = "gemini.ai@google.com";
const String studentBio = "I'm currently focused on enhancing large language models to provide world-class assistance. I believe clear, structured, and compliant code is the key to excellent digital tools. My current passion project is exploring generative UI design.";

// --- Color Palette ---
const Color primaryColor = Color(0xFF673AB7); // Deep Purple
const Color secondaryColor = Color(0xFF9C27B0); // Lighter Purple
const Color accentColor = Color(0xFF42A5F5); // Blue for indicators
const Color cardColor = Color(0xFF5E35B1); // Slightly lighter card for contrast

void main() {
  // Ensure the system bars are styled to match the app
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
        scaffoldBackgroundColor: const Color(0xFFF5F5F5), // Light gray background
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          iconTheme: IconThemeData(color: Colors.black),
        ),
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

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        // The app now navigates between Home, Reports, and Profile pages.
        children: const <Widget>[
          HomePage(),      // Page 1
          ReportsPage(),   // Page 2
          ProfilePage(),   // Page 3
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment_outlined),
            activeIcon: Icon(Icons.assessment),
            label: 'Reports',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

// --- PAGE 1: Home Page ---
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate(
            [
              _buildAppBar(context),
              _buildBalanceCard(context),
              _buildQuickActions(),
              _buildRecentTransactionsHeader(context),
            ],
          ),
        ),
        _buildTransactionsList(),
      ],
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 60, 16, 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: primaryColor,
                child: Text('G', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Welcome back,', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                  const Text(studentName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ],
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceCard(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Total Balance',
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          const SizedBox(height: 4),
          const Text(
            '\$8,945.62',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Savings', style: TextStyle(color: Colors.white70)),
                  Text('\$5,500', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text('Last 30 Days', style: TextStyle(color: Colors.white70)),
                  Text('+ \$450.00 ↗', style: TextStyle(color: Color(0xFF64DD17), fontWeight: FontWeight.bold)), // Green accent
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildActionButton(Icons.compare_arrows, 'Transfer'),
          _buildActionButton(Icons.receipt_long, 'Pay Bills'),
          _buildActionButton(Icons.trending_up, 'Invest'),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 5,
              ),
            ],
          ),
          child: Icon(icon, color: primaryColor),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget _buildRecentTransactionsHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Recent Transactions',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('View All', style: TextStyle(color: primaryColor)),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionsList() {
    // Corrected to use explicit type annotation for the Map values
    final transactions = const <Map<String, Object>>[
      {'title': 'Netflix Subscription', 'subtitle': 'Entertainment - Today', 'amount': '-\$19.99', 'color': Colors.red},
      {'title': 'Coffee Shop', 'subtitle': 'Food & Drink - Today', 'amount': '-\$4.50', 'color': Colors.red},
      {'title': 'Salary Deposit', 'subtitle': 'Income - Yesterday', 'amount': '+\$3500.00', 'color': Colors.green},
      {'title': 'Grocery Store', 'subtitle': 'Shopping - 2 Days ago', 'amount': '-\$55.80', 'color': Colors.red},
      {'title': 'Amazon Purchase', 'subtitle': 'Shopping - 2 Days ago', 'amount': '-\$120.45', 'color': Colors.red},
    ];

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
              (context, index) {
            final tx = transactions[index];
            return ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  // FIX: Replaced withAlpha for deprecated withOpacity
                  color: primaryColor.withAlpha(255 ~/ 10),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  index.isEven ? Icons.shopping_bag_outlined : Icons.monetization_on_outlined,
                  color: primaryColor,
                ),
              ),
              // FIX: Explicitly cast values to String to resolve Object to String errors
              title: Text(tx['title']! as String, style: const TextStyle(fontWeight: FontWeight.w500)),
              subtitle: Text(tx['subtitle']! as String, style: const TextStyle(fontSize: 12)),
              trailing: Text(
                tx['amount']! as String,
                style: TextStyle(
                  // FIX: Explicitly cast value to Color
                  color: tx['color']! as Color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
          childCount: transactions.length,
        ),
      ),
    );
  }
}

// --- PAGE 2: Reports Page (Selected to build) ---
class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildAppBar(context),
          _buildSpendingSummary(),
          _buildSpendingBreakdown(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 60, 16, 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: primaryColor,
                child: Text('G', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Welcome back,', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                  const Text(studentName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ],
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildSpendingSummary() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Monthly Spending Report',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Total Expenses (Last 30 days)', style: TextStyle(color: Colors.grey)),
                  const SizedBox(height: 4),
                  const Text(
                    '-\$1,270.00',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: const [
                      Icon(Icons.arrow_upward, color: Colors.red, size: 16),
                      Text(
                        '10% up from last month',
                        style: TextStyle(color: Colors.red, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpendingBreakdown() {
    // Corrected to use explicit type annotation for the Map values
    final breakdown = const <Map<String, Object>>[
      {'category': 'Food & Drink', 'amount': 450.00, 'percent': 35, 'color': Colors.red},
      {'category': 'Shopping', 'amount': 320.00, 'percent': 25, 'color': Colors.orange},
      {'category': 'Housing', 'amount': 280.00, 'percent': 22, 'color': Colors.yellow},
      {'category': 'Transport', 'amount': 150.00, 'percent': 12, 'color': accentColor},
      {'category': 'Other', 'amount': 70.00, 'percent': 6, 'color': Colors.pink},
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Spending Breakdown',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: breakdown.map((item) {
                  return _buildBreakdownItem(
                    item['category']! as String,
                    item['amount']! as double,
                    item['percent']! as int,
                    item['color']! as Color,
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBreakdownItem(String category, double amount, int percent, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(category, style: const TextStyle(fontWeight: FontWeight.w500)),
              // FIX: Removed unnecessary braces from string interpolation
              Text(
                '\$${amount.toStringAsFixed(2)} (${percent}%)',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 4),
          LinearProgressIndicator(
            value: percent / 100.0,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(color),
            minHeight: 8,
            borderRadius: BorderRadius.circular(4),
          ),
        ],
      ),
    );
  }
}

// --- PAGE 4: Profile Page ---
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildAppBar(context),
          _buildProfileHeader(context),
          _buildProfileInfo(context, 'Name', studentName),
          _buildProfileInfo(context, 'Student ID', studentId),
          _buildProfileInfo(context, 'Email', studentEmail),
          _buildBioSection(context),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 60, 16, 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: primaryColor,
                child: Text('G', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Welcome back,', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                  const Text(studentName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ],
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const Text(
            'User Profile',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Container(
            width: 90,
            height: 90,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [accentColor, primaryColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Center(
              child: Text(
                'GA', // Initials for Gemini AI
                style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileInfo(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 14)),
          const SizedBox(height: 4),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Text(
              value,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBioSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Bio / Story', style: TextStyle(color: Colors.grey, fontSize: 14)),
          const SizedBox(height: 4),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  studentBio,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 10),
                const Text(
                  '[Note: Student details replaced with actual Gemini AI information]',
                  style: TextStyle(fontSize: 12, color: Colors.red),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// The app now implements Home (Page 1), Reports (Page 2), and Profile (Page 3) pages.