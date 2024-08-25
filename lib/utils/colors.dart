import 'package:flutter/material.dart';

class AppColors {
  static const Color kPrimary = Color(0xFF12CDD9);
  static const Color kWhite = Color(0xFFFEFEFE);
  // ignore: constant_identifier_names
  static const Color KBackground = Color(0xFF1F1D2B);
  static LinearGradient customOnboardingGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      const Color(0xFF110C1D).withOpacity(0.0),
      const Color(0xFF110C1D),
    ],
  );
}
