import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      primaryColor: const Color(0xFF8B623B),
      scaffoldBackgroundColor: Colors.grey.shade100,
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xFF8B623B),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 4,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF8B623B),
          foregroundColor: Colors.white,
          textStyle:  TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 2,
        ),
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(fontSize: 18.sp, color: Colors.black87),
        bodyMedium: TextStyle(fontSize: 16.sp, color: Colors.black54),
        titleLarge: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600, color: Colors.black87),
      ),
      cardTheme: CardThemeData(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xFF8B623B),
        foregroundColor: Colors.white,
        elevation: 4,
        shape: CircleBorder(),
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF8B623B),
        primary: const Color(0xFF8B623B),
        secondary: const Color(0xFFD4A574),
        surface: const Color(0xFFFAF9F6),
        onSurface: const Color(0xFF2C1810),
      ),
    );
  }
}
