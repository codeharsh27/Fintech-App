import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryColor = Color(
    0xFFC1F2B0,
  ); // Light Mint Green (from design)
  static const Color secondaryColor = Color(0xFF65B741); // Darker Green
  static const Color accentColor = Color(0xFFFFB534); // Yellow/Orange accent
  static const Color errorColor = Color(0xFFFF5252);
  static const Color backgroundColor = Color(0xFF121212); // Dark Background
  static const Color surfaceColor = Color(0xFF1E1E1E); // Dark Card Surface
  static const Color onSurfaceColor = Colors.white;

  static final TextTheme textTheme = TextTheme(
    displayLarge: GoogleFonts.outfit(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    displayMedium: GoogleFonts.outfit(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    displaySmall: GoogleFonts.outfit(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headlineMedium: GoogleFonts.outfit(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    bodyLarge: GoogleFonts.outfit(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: Colors.white70,
    ),
    bodyMedium: GoogleFonts.outfit(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Colors.white60,
    ),
    labelLarge: GoogleFonts.outfit(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.black87,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      brightness: Brightness.dark,
      primary: primaryColor,
      secondary: secondaryColor,
      tertiary: accentColor,
      error: errorColor,
      background: backgroundColor,
      surface: surfaceColor,
      onSurface: onSurfaceColor,
    ),
    scaffoldBackgroundColor: backgroundColor,
    textTheme: textTheme,
    appBarTheme: const AppBarTheme(
      backgroundColor: backgroundColor,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.black, // Text on green button should be dark
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        textStyle: textTheme.labelLarge?.copyWith(color: Colors.black),
      ),
    ),
    cardTheme: CardThemeData(
      color: surfaceColor,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      margin: const EdgeInsets.all(8),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: surfaceColor,
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.white54,
    ),
  );
}
