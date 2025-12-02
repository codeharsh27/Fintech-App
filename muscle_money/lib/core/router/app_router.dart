import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/pages/splash_page.dart';
import '../../features/auth/presentation/pages/onboarding_page.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/goal_selection_page.dart';
import '../../features/dashboard/presentation/pages/dashboard_page.dart';
import '../../features/dashboard/presentation/pages/home_page.dart';
import '../../features/dashboard/presentation/pages/scan_page.dart';
import '../../features/learning/presentation/pages/learn_page.dart';
import '../../features/invest/presentation/pages/invest_page.dart';
import '../../features/simulator/presentation/pages/simulator_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

class AppRouter {
  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashPage()),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
      GoRoute(
        path: '/goal-selection',
        builder: (context, state) => const GoalSelectionPage(),
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return DashboardPage(child: child);
        },
        routes: [
          GoRoute(path: '/home', builder: (context, state) => const HomePage()),
          GoRoute(
            path: '/learn',
            builder: (context, state) => const LearnPage(),
          ),
          GoRoute(
            path: '/invest',
            builder: (context, state) => const InvestPage(),
          ),
          GoRoute(
            path: '/simulator',
            builder: (context, state) => const SimulatorPage(),
          ),
          GoRoute(
            path: '/profile',
            builder: (context, state) => const ProfilePage(),
          ),
        ],
      ),
      GoRoute(path: '/scan', builder: (context, state) => const ScanPage()),
    ],
  );
}
