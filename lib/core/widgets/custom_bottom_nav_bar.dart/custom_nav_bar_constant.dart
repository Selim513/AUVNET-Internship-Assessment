import 'package:flutter/material.dart';

/// Constants for navigation bar styling and configuration
class NavBarConstants {
  // Default Colors
  static const Color defaultBackgroundColor = Colors.white;
  static const Color defaultSelectedColor = Colors.blue;
  static const Color defaultUnselectedColor = Colors.grey;
  static const Color defaultIndicatorColor = Colors.blue;

  // Default Sizes
  static const double defaultHeight = 70.0;
  static const double defaultIndicatorHeight = 3.0;
  static const double defaultIndicatorWidth = 40.0;
  static const double defaultIconSize = 24.0;
  static const double defaultFontSize = 12.0;

  // Animation Duration
  static const Duration animationDuration = Duration(milliseconds: 300);

  // Spacing
  static const EdgeInsets defaultPadding = EdgeInsets.only(top: 8.0);
  static const EdgeInsets itemPadding = EdgeInsets.symmetric(vertical: 8.0);
  static const double iconTextSpacing = 4.0;

  // Shadow
  static List<BoxShadow> get defaultShadow => [
    BoxShadow(
      color: Colors.black.withValues(alpha: .1),
      blurRadius: 4,
      offset: const Offset(0, -2),
    ),
  ];

  // Font Weights
  static const FontWeight selectedFontWeight = FontWeight.w600;
  static const FontWeight unselectedFontWeight = FontWeight.normal;
}
