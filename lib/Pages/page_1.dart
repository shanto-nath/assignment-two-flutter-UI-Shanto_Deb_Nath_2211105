import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff7f7f7), // Light background
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),

              const SizedBox(height: 25),

              _buildBalanceCard(),

              const SizedBox(height: 25),

              _buildActionButtons(context),

              const SizedBox(height: 30),

              const Text(
                "Recent Transactions",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 15),

              
              _buildTransactionItem(
                title: "Netflix Subscription",
                category: "Entertainment",
                date: "Today",
                amount: -19.99,
                iconData: Icons.movie_outlined, 
              ),

              _buildTransactionItem(
                title: "Coffee Shop",
                category: "Food & Drink",
                date: "Today",
                amount: -4.50,
                iconData: Icons.coffee_outlined, 
              ),

              _buildTransactionItem(
                title: "Salary Deposit",
                category: "Income",
                date: "Yesterday",
                amount: 3500.00,
                iconData: Icons
                    .account_balance_wallet_outlined, 
              ),

              _buildTransactionItem(
                title: "Grocery Store",
                category: "Shopping",
                date: "Yesterday",
                amount: -55.80,
                iconData: Icons.add_shopping_cart_rounded, 
              ),

              _buildTransactionItem(
                title: "Amazon Purchase",
                category: "Shopping",
                date: "2 days ago",
                amount: -120.45,
                iconData: Icons.shopping_cart,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 24,
          backgroundColor: Color(0xff7f00ff), 
          child: Text(
            "SDN",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Welcome back,",
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            Text(
              "Shanto Deb Nath",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const Spacer(),
        const Icon(Icons.notifications_none, size: 26),
      ],
    );
  }

  Widget _buildBalanceCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xff0f0c29), Color(0xff302b63), Color(0xff24243e)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(25), 
        boxShadow: [
          BoxShadow(
            color: const Color(
              0xff302b63,
            ).withOpacity(0.5), 
            blurRadius: 15,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Total Balance",
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
          SizedBox(height: 8),
          Text(
            "\$8,945.32",
            style: TextStyle(
              fontSize: 40, 
              color: Color(0xff9e76ff), 
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Savings: \$5,500", style: TextStyle(color: Colors.white)),
              Text(
                "Last 30 days: +\$300",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildActionButton(Icons.send, "Transfer"),
        _buildActionButton(Icons.receipt_long, "Pay Bills"),
        _buildActionButton(Icons.show_chart, "Invest"),
      ],
    );
  }

  Widget _buildActionButton(IconData icon, String text) {
    return Container(
      width: 100,
      height: 100,
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20), 
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2), 
            spreadRadius: 0,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 32,
            color: const Color(0xff7f00ff),
          ),
          const SizedBox(height: 8),
          Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionItem({
    required String title,
    required String category,
    required String date,
    required double amount,
    required IconData iconData, 
  }) {

    final isIncome = amount >= 0;
    final amountColor = isIncome
        ? const Color.fromARGB(255, 12, 69, 15)
        : const Color(0xffe53935);
    final iconBgColor = isIncome
        ? Colors.yellow.shade100
        : Colors.grey.shade200;

    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 10,
            spreadRadius: 0,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(
                10,
              ), 
            ),
            child: Icon(
              iconData,
              size: 24,
              color: isIncome ? const Color(0xffc0a440) : Colors.black54,
            ), 
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "$category • $date",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade600,
                  ), 
                ),
              ],
            ),
          ),

          Text(
            isIncome
                ? "+\$${amount.toStringAsFixed(2)}"
                : "\$${amount.abs().toStringAsFixed(2)}",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: amountColor,
            ),
          ),
        ],
      ),
    );
  }
}
