import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryBlue = Color(0xFF007AFF);
  static const Color primaryPurple = Color(0xFF6366F1);
  static const Color secondaryPurple = Color(0xFF8B5CF6);

  // Theme-aligned deep blue (used for shadows / accents)
  static const Color deepBlue = Color(0xFF1E3A8A);

  static const Color nameIconColor = Color(0xFF34C759);
  static const Color phoneIconColor = Color(0xFFDC241F);
  static const Color emailIconColor = Color(0xFF007AFF);
  static const Color passwordIconColor = Color(0xFFFF9500);
  static const Color confirmPasswordIconColor = Color(0xFF5856D6);

  static const Color successGreen = Color(0xFF34C759);
  static const Color errorRed = Color(0xFFFF3B30);
  static const Color warningOrange = Color(0xFFFF9500);

  static const Color backgroundColor = Colors.white;
  static const Color textColor = Colors.black87;
  static const Color hintTextColor = Color(0xFF666666);
  static const Color borderColor = Color(0xFFE5E5E5);

  // Matches the dark blue header theme (bright blue -> deep navy)
  static const List<Color> buttonGradient = [
    Color(0xFF3B82F6),
    Color(0xFF1E3A8A),
  ];

  // Blue -> Cyan gradient for titles (harmonizes with the header)
  static const List<Color> textGradient = [
    Color(0xFF3B82F6),
    Color(0xFF06B6D4),
  ];

  static Color getHintTextColor(BuildContext context) => Colors.grey.shade700;
  static Color getBorderColor(BuildContext context) => Colors.grey.shade300;
}
