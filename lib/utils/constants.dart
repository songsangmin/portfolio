import 'package:flutter/material.dart';

// Modern Color Palette
const Color kPrimaryColor = Color(0xFF6366F1); // Indigo
const Color kSecondaryColor = Color(0xFF8B5CF6); // Purple
const Color kAccentColor = Color(0xFFEC4899); // Pink
const Color kBackgroundColor = Color(0xFF0F172A); // Slate 900
const Color kSurfaceColor = Color(0xFF1E293B); // Slate 800
const Color kWhiteColor = Color(0xFFFFFFFF);
const Color kDangerColor = Color(0xFFEF4444); // Red
const Color kCaptionColor = Color(0xFF94A3B8); // Slate 400
const Color kTextPrimary = Color(0xFFF1F5F9); // Slate 100
const Color kTextSecondary = Color(0xFFCBD5E1); // Slate 300

// Gradient Colors
const LinearGradient kPrimaryGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFF6366F1), Color(0xFF8B5CF6), Color(0xFFEC4899)],
);

const LinearGradient kBackgroundGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFF0F172A), Color(0xFF1E293B), Color(0xFF334155)],
);

// Shadows
const List<BoxShadow> kCardShadow = [
  BoxShadow(
    color: Color(0x1A000000),
    blurRadius: 20,
    offset: Offset(0, 10),
    spreadRadius: 0,
  ),
];

const List<BoxShadow> kElevatedShadow = [
  BoxShadow(
    color: Color(0x33000000),
    blurRadius: 30,
    offset: Offset(0, 15),
    spreadRadius: -5,
  ),
];

// Border Radius
const double kBorderRadius = 16.0;
const double kBorderRadiusSmall = 8.0;
const double kBorderRadiusLarge = 24.0;

// Spacing
const double kSpacingSmall = 8.0;
const double kSpacingMedium = 16.0;
const double kSpacingLarge = 24.0;
const double kSpacingXLarge = 32.0;

const double kDesktopMaxWidth = 1100.0;
const double kTabletMaxWidth = 760.0;
double getMobileMaxWidth(BuildContext context) =>
    MediaQuery.of(context).size.width * .8;