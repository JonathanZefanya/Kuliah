import 'package:flutter/material.dart';

class AppConstants {
  // Theme Colors
  static const Color primaryColor = Colors.blueAccent;
  static const Color secondaryColor = Colors.white;
  static const Color backgroundColor = Colors.grey;

  // Font Styles
  static const TextStyle headingStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: primaryColor,
  );

  static const TextStyle subheadingStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static const TextStyle bodyTextStyle = TextStyle(
    fontSize: 14,
    color: Colors.black54,
  );

  // Padding & Margins
  static const double defaultPadding = 16.0;
}
