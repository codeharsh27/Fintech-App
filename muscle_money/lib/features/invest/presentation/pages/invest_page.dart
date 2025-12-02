import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class InvestPage extends StatelessWidget {
  const InvestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Invest')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPortfolioCard(context),
            const SizedBox(height: 24),
            Text(
              'Investment Options',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildInvestmentOption(
              context,
              title: 'Digital Gold',
              description: 'Start with as low as ₹10. Safe and secure.',
              icon: Icons.monetization_on,
              color: Colors.amber,
            ),
            const SizedBox(height: 16),
            _buildInvestmentOption(
              context,
              title: 'Mutual Funds',
              description: 'Expert managed funds for long term growth.',
              icon: Icons.pie_chart,
              color: AppTheme.secondaryColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPortfolioCard(BuildContext context) {
    return Card(
      color: AppTheme.primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              'Current Value',
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: Colors.white70),
            ),
            const SizedBox(height: 8),
            Text(
              '₹ 0.00',
              style: Theme.of(
                context,
              ).textTheme.displayMedium?.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      'Invested',
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(color: Colors.white70),
                    ),
                    Text(
                      '₹ 0.00',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 30,
                  width: 1,
                  color: Colors.white24,
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                ),
                Column(
                  children: [
                    Text(
                      'Returns',
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(color: Colors.white70),
                    ),
                    Text(
                      '+ ₹ 0.00 (0%)',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInvestmentOption(
    BuildContext context, {
    required String title,
    required String description,
    required IconData icon,
    required Color color,
  }) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // TODO: Navigate to investment detail
        },
      ),
    );
  }
}
