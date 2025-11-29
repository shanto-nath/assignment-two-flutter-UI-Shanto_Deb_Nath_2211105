import 'package:flutter/material.dart';
import '../../main.dart'; // Import constants from main.dart

class Page1Content extends StatelessWidget {
  const Page1Content({super.key});

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
          child: const Icon(Icons.abc, color: primaryColor),
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
                  color: primaryColor.withAlpha(255 ~/ 10),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  index.isEven ? Icons.shopping_bag_outlined : Icons.monetization_on_outlined,
                  color: primaryColor,
                ),
              ),
              title: Text(tx['title']! as String, style: const TextStyle(fontWeight: FontWeight.w500)),
              subtitle: Text(tx['subtitle']! as String, style: const TextStyle(fontSize: 12)),
              trailing: Text(
                tx['amount']! as String,
                style: TextStyle(
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