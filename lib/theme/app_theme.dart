import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Paleta profesional: slate frío + teal profundo (sin púrpura AI).
class AppColors {
  static const ink = Color(0xFF0F172A);
  static const slate = Color(0xFF334155);
  static const muted = Color(0xFF64748B);
  static const surface = Color(0xFFF1F5F9);
  static const surfaceAlt = Color(0xFFE2E8F0);
  static const card = Color(0xFFF8FAFC);
  static const teal = Color(0xFF0F766E);
  static const tealDeep = Color(0xFF115E59);
  static const tealSoft = Color(0xFFCCFBF1);
  static const danger = Color(0xFFB91C1C);
  static const warn = Color(0xFFB45309);
  static const success = Color(0xFF047857);
}

ThemeData buildAppTheme() {
  final base = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.teal,
      brightness: Brightness.light,
      primary: AppColors.teal,
      onPrimary: Colors.white,
      secondary: AppColors.slate,
      surface: AppColors.surface,
      error: AppColors.danger,
    ),
    scaffoldBackgroundColor: AppColors.surface,
  );

  final textTheme = GoogleFonts.dmSansTextTheme(base.textTheme).copyWith(
    displaySmall: GoogleFonts.plusJakartaSans(
      fontWeight: FontWeight.w700,
      color: AppColors.ink,
      letterSpacing: -0.5,
    ),
    headlineMedium: GoogleFonts.plusJakartaSans(
      fontWeight: FontWeight.w700,
      color: AppColors.ink,
      letterSpacing: -0.3,
    ),
    headlineSmall: GoogleFonts.plusJakartaSans(
      fontWeight: FontWeight.w600,
      color: AppColors.ink,
    ),
    titleLarge: GoogleFonts.plusJakartaSans(
      fontWeight: FontWeight.w600,
      color: AppColors.ink,
    ),
    titleMedium: GoogleFonts.dmSans(
      fontWeight: FontWeight.w600,
      color: AppColors.ink,
    ),
    bodyLarge: GoogleFonts.dmSans(color: AppColors.slate, height: 1.4),
    bodyMedium: GoogleFonts.dmSans(color: AppColors.slate, height: 1.4),
    labelLarge: GoogleFonts.dmSans(
      fontWeight: FontWeight.w600,
      letterSpacing: 0.2,
    ),
  );

  return base.copyWith(
    textTheme: textTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      titleTextStyle: GoogleFonts.plusJakartaSans(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: AppColors.ink,
      ),
      iconTheme: const IconThemeData(color: AppColors.ink),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.teal,
      foregroundColor: Colors.white,
      elevation: 2,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.teal,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: GoogleFonts.dmSans(fontWeight: FontWeight.w600),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.tealDeep,
        side: const BorderSide(color: AppColors.teal, width: 1.2),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.surfaceAlt),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.surfaceAlt),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.teal, width: 1.5),
      ),
      labelStyle: const TextStyle(color: AppColors.muted),
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.surfaceAlt,
      thickness: 1,
      space: 1,
    ),
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      backgroundColor: AppColors.ink,
      contentTextStyle: GoogleFonts.dmSans(color: Colors.white),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
  );
}
