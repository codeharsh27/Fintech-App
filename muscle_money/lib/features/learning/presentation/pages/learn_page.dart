import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_theme.dart';

class LearnPage extends StatelessWidget {
  const LearnPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Learning Path')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildCourseCard(
            context,
            title: 'Mutual Funds 101',
            description:
                'Understand the basics of mutual funds and how to start investing.',
            progress: 0.6,
            color: AppTheme.secondaryColor,
            isLocked: false,
          ),
          const SizedBox(height: 16),
          _buildCourseCard(
            context,
            title: 'Stock Market Basics',
            description:
                'Learn how the stock market works and how to pick stocks.',
            progress: 0.0,
            color: AppTheme.accentColor,
            isLocked: true,
          ),
          const SizedBox(height: 16),
          _buildCourseCard(
            context,
            title: 'Personal Finance',
            description:
                'Master budgeting, saving, and managing your expenses.',
            progress: 0.0,
            color: Colors.blue,
            isLocked: true,
          ),
        ],
      ),
    );
  }

  Widget _buildCourseCard(
    BuildContext context, {
    required String title,
    required String description,
    required double progress,
    required Color color,
    required bool isLocked,
  }) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: isLocked
            ? null
            : () {
                // Navigate to lesson detail
                // context.push('/learn/lesson/1');
                // For now just show a snackbar or something, or we can create a dummy route
              },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 120,
              color: color.withOpacity(0.2),
              child: Center(
                child: Icon(
                  isLocked ? Icons.lock : Icons.play_circle_filled,
                  size: 48,
                  color: color,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (!isLocked) ...[
                    LinearProgressIndicator(
                      value: progress,
                      backgroundColor: Colors.grey.shade200,
                      color: color,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${(progress * 100).toInt()}% Completed',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
