import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Brand colors
  static const Color primary = Color(0xFF60B342);
  static const Color secondary = Color(0xFFFF7A06);
  static const Color appBackground = Color(0xFFF7FBF7);
  static const Color danger = Color(0xFFFF5B5B);
  static const Color green900 = Color(0xFFE6F3E6);
  static const Color green800 = Color(0xFFD1E5DB);
  static const Color green100 = Color(0xFF80E45B);
  static const Color white100 = Color(0xFFFEFEFE);
  static const Color grey200 = Color(0xFFE1E1E1);
  static const Color grey300 = Color(0xFFBFBFBF);
  static const Color grey400 = Color(0xFFA8A8A8);
  static const Color grey500 = Color(0xFF808080);
  static const Color grey600 = Color(0xFF686868);
  static const Color grey700 = Color(0xFF484848);
  static const Color grey800 = Color(0xFF282828);
  static const Color grey900 = Color(0xFF161616);

  static const linearGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF8EEA6D), // #8EEA6D at -5.69%
      Color(0xFF60B342), // #60B342 at 50.48%
      Color(0xFF41A41D), // #41A41D at 102.12%
    ],
    stops: [
      -0.0569,
      0.5048,
      1.0212,
    ],
    tileMode: TileMode.clamp,
  );

  // Utility Colors
  static const Color success = Color(0xFF4CAF50); // Green for success messages
  static const Color warning = Color(0xFFFFA726); // Orange for warnings
  static const Color error = Color(0xFFF44336); // Red for error messages
  static const Color info = Color(0xFF29B6F6); // Blue for informational messages
}