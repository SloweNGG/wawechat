import 'package:flutter/material.dart';

/// WaweChat renk paleti. Uygulamadaki tüm renkler buradan gelir.
abstract final class AppColors {
  static const background = Color(0xFF07070C);
  static const surface = Color(0xFF0E0E16);
  static const surfaceHigh = Color(0xFF161620);
  static const border = Color(0xFF24243A);

  static const primary = Color(0xFFFA6D9B);
  static const secondary = Color(0xFF8B5CF6);
  static const error = Color(0xFFFF5C7A);

  static const text = Color(0xFFF1F1F8);
  static const textMuted = Color(0xFFA0A0B8);

  /// Mordan pembeye geçişli vurgu.
  static const accentGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [secondary, primary],
  );
}
