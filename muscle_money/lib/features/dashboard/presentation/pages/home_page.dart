import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:fl_chart/fl_chart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedPeriod = 'Weekly';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                'https://imageio.forbes.com/specials-images/imageserve/6422ff333a09b807eaa10bb7/0x0.jpg?format=jpg&crop=649,648,x1013,y86,safe&height=416&width=416&fit=bounds',
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome,',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
                Text(
                  'Nikhil Kamath',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppTheme.surfaceColor,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.notifications,
              size: 20,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background
          Container(color: const Color(0xFF121212)),
          Positioned(
            top: -100,
            left: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.1),
              ),
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
              child: Container(color: Colors.transparent),
            ),
          ),
          // Content
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  _buildBalanceSection(context),
                  const SizedBox(height: 32),
                  _buildWidgetAction(context),
                  const SizedBox(height: 32),
                  _buildRecentTransactions(context),
                  const SizedBox(height: 32),
                  _buildSavingsChart(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceSection(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'My Total Balance',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.white70),
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$ 8,350.00',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: AppTheme.surfaceColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: [
                    Text(
                      'USD',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Icon(
                      Icons.arrow_drop_down,
                      size: 14,
                      color: Colors.white54,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.bodySmall,
              children: [
                const TextSpan(text: 'You save '),
                TextSpan(
                  text: '\$240',
                  style: const TextStyle(
                    color: Color(0xFF4ADE80), // Bright green
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(text: ' this month'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWidgetAction(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Widget Action',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            Text('Edit widget', style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 215, 249, 205),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildActionButton(
                context,
                CupertinoIcons.qrcode_viewfinder,
                'Scan',
                onTap: () => context.push('/scan'),
              ),
              _buildActionButton(
                context,
                CupertinoIcons.paperplane,
                'Send',
                onTap: () => _showSendBottomSheet(context),
              ),
              _buildActionButton(
                context,
                CupertinoIcons.arrow_down_to_line,
                'Request',
                onTap: () => _showRequestBottomSheet(context),
              ),
              _buildActionButton(context, CupertinoIcons.ellipsis, 'More'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton(
    BuildContext context,
    IconData icon,
    String label, {
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, color: Colors.black87, size: 28),
          const SizedBox(height: 8),
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  void _showSendBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppTheme.surfaceColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Send Money',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildSendContact('Alex', 'https://i.pravatar.cc/150?img=12'),
                _buildSendContact('Sarah', 'https://i.pravatar.cc/150?img=5'),
                _buildSendContact('Mike', 'https://i.pravatar.cc/150?img=33'),
                _buildSendContact('Anna', 'https://i.pravatar.cc/150?img=9'),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  void _showRequestBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppTheme.surfaceColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Request Money',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildSendContact('David', 'https://i.pravatar.cc/150?img=60'),
                _buildSendContact('Emma', 'https://i.pravatar.cc/150?img=44'),
                _buildSendContact('John', 'https://i.pravatar.cc/150?img=11'),
                _buildSendContact('Lisa', 'https://i.pravatar.cc/150?img=22'),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildSendContact(String name, String imageUrl) {
    return Column(
      children: [
        CircleAvatar(radius: 30, backgroundImage: NetworkImage(imageUrl)),
        const SizedBox(height: 8),
        Text(name, style: const TextStyle(color: Colors.white70, fontSize: 12)),
      ],
    );
  }

  Widget _buildRecentTransactions(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 100,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.surfaceColor,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.savings_outlined,
                  color: Colors.white54,
                  size: 28,
                ),
                const SizedBox(height: 8),
                Text(
                  'Pension fund',
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(fontSize: 10),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          flex: 2,
          child: Container(
            height: 100,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFFFE8C5), // Light orange/beige from design
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Recent Transaction',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Align(
                      widthFactor: 0.7,
                      alignment: Alignment.centerLeft,
                      child: _buildAvatar('https://i.pravatar.cc/150?img=12'),
                    ),
                    Align(
                      widthFactor: 0.7,
                      alignment: Alignment.centerLeft,
                      child: _buildAvatar('https://i.pravatar.cc/150?img=33'),
                    ),
                    Align(
                      widthFactor: 0.7,
                      alignment: Alignment.centerLeft,
                      child: _buildAvatar('https://i.pravatar.cc/150?img=5'),
                    ),
                    Align(
                      widthFactor: 0.7,
                      alignment: Alignment.centerLeft,
                      child: const CircleAvatar(
                        radius: 14,
                        backgroundColor: Colors.black,
                        child: Text(
                          'N',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const Icon(Icons.apple, color: Colors.black, size: 28),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAvatar(String url) {
    return CircleAvatar(
      radius: 14,
      backgroundColor: Colors.white,
      child: CircleAvatar(radius: 12, backgroundImage: NetworkImage(url)),
    );
  }

  Widget _buildSavingsChart(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'My Saving',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () => _showPeriodSelector(context),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.surfaceColor,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white24),
                ),
                child: Row(
                  children: [
                    Text(
                      _selectedPeriod,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      size: 16,
                      color: Colors.white54,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          height: 200,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppTheme.surfaceColor,
            borderRadius: BorderRadius.circular(24),
          ),
          child: LineChart(
            LineChartData(
              gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                horizontalInterval: 2000,
                getDrawingHorizontalLine: (value) {
                  return FlLine(
                    color: Colors.white.withOpacity(0.1),
                    strokeWidth: 1,
                  );
                },
              ),
              titlesData: FlTitlesData(
                show: true,
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 30,
                    interval: 1,
                    getTitlesWidget: (value, meta) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          _getBottomTitle(value.toInt()),
                          style: const TextStyle(
                            color: Colors.white24,
                            fontSize: 10,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 2000,
                    reservedSize: 42,
                    getTitlesWidget: (value, meta) {
                      return Text(
                        '\$${(value / 1000).toStringAsFixed(0)}k',
                        style: const TextStyle(
                          color: Colors.white24,
                          fontSize: 10,
                        ),
                      );
                    },
                  ),
                ),
              ),
              borderData: FlBorderData(show: false),
              minX: 0,
              maxX: _getMaxX(),
              minY: 0,
              maxY: 8000,
              lineTouchData: LineTouchData(
                enabled: true,
                touchTooltipData: LineTouchTooltipData(
                  getTooltipColor: (touchedSpot) => AppTheme.primaryColor,
                  tooltipBorder: BorderSide(
                    color: AppTheme.primaryColor,
                    width: 1,
                  ),
                  tooltipPadding: const EdgeInsets.all(8),
                  getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
                    return touchedBarSpots.map((barSpot) {
                      return LineTooltipItem(
                        '\$${barSpot.y.toStringAsFixed(0)}',
                        const TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      );
                    }).toList();
                  },
                ),
                handleBuiltInTouches: true,
                getTouchedSpotIndicator:
                    (LineChartBarData barData, List<int> spotIndexes) {
                      return spotIndexes.map((spotIndex) {
                        return TouchedSpotIndicatorData(
                          FlLine(
                            color: AppTheme.primaryColor,
                            strokeWidth: 2,
                            dashArray: [5, 5],
                          ),
                          FlDotData(
                            getDotPainter: (spot, percent, barData, index) {
                              return FlDotCirclePainter(
                                radius: 6,
                                color: AppTheme.primaryColor,
                                strokeWidth: 2,
                                strokeColor: Colors.white,
                              );
                            },
                          ),
                        );
                      }).toList();
                    },
              ),
              lineBarsData: [
                LineChartBarData(
                  spots: _getChartData(),
                  isCurved: true,
                  color: AppTheme.primaryColor,
                  barWidth: 3,
                  isStrokeCapRound: true,
                  dotData: FlDotData(
                    show: true,
                    getDotPainter: (spot, percent, barData, index) {
                      return FlDotCirclePainter(
                        radius: 4,
                        color: AppTheme.primaryColor,
                        strokeWidth: 0,
                      );
                    },
                  ),
                  belowBarData: BarAreaData(
                    show: true,
                    color: AppTheme.primaryColor.withOpacity(0.1),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showPeriodSelector(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppTheme.surfaceColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Select Period',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            _buildPeriodOption('Weekly'),
            _buildPeriodOption('Monthly'),
            _buildPeriodOption('Yearly'),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildPeriodOption(String period) {
    final isSelected = _selectedPeriod == period;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPeriod = period;
        });
        Navigator.pop(context);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: isSelected
              ? AppTheme.primaryColor.withOpacity(0.2)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppTheme.primaryColor : Colors.white24,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Icon(
              isSelected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color: isSelected ? AppTheme.primaryColor : Colors.white54,
            ),
            const SizedBox(width: 12),
            Text(
              period,
              style: TextStyle(
                color: isSelected ? AppTheme.primaryColor : Colors.white,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<FlSpot> _getChartData() {
    switch (_selectedPeriod) {
      case 'Weekly':
        return [
          const FlSpot(0, 4200),
          const FlSpot(1, 5100),
          const FlSpot(2, 3800),
          const FlSpot(3, 6200),
          const FlSpot(4, 5500),
          const FlSpot(5, 4800),
          const FlSpot(6, 7200),
        ];
      case 'Monthly':
        return [
          const FlSpot(0, 3500),
          const FlSpot(1, 4200),
          const FlSpot(2, 5800),
          const FlSpot(3, 4900),
          const FlSpot(4, 6500),
          const FlSpot(5, 7200),
        ];
      case 'Yearly':
        return [
          const FlSpot(0, 2800),
          const FlSpot(1, 3500),
          const FlSpot(2, 4200),
          const FlSpot(3, 5100),
          const FlSpot(4, 6800),
        ];
      default:
        return [];
    }
  }

  double _getMaxX() {
    switch (_selectedPeriod) {
      case 'Weekly':
        return 6;
      case 'Monthly':
        return 5;
      case 'Yearly':
        return 4;
      default:
        return 6;
    }
  }

  String _getBottomTitle(int value) {
    switch (_selectedPeriod) {
      case 'Weekly':
        const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
        return value < days.length ? days[value] : '';
      case 'Monthly':
        const months = ['Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
        return value < months.length ? months[value] : '';
      case 'Yearly':
        const years = ['2020', '2021', '2022', '2023', '2024'];
        return value < years.length ? years[value] : '';
      default:
        return '';
    }
  }
}
