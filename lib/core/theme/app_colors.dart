import 'package:flutter/material.dart';

/// Centralized LUMORA palette. Never hardcode raw color values in widgets —
/// reference these instead.
class AppColors {
  AppColors._();

  // Core editorial palette.
  static const Color forestGreen = Color(0xFF1B4332);
  static const Color forestGreenDark = Color(0xFF123023);
  static const Color warmIvory = Color(0xFFF7F1E6);
  static const Color warmIvoryDeep = Color(0xFFEFE6D4);
  static const Color terracotta = Color(0xFFC1684A);
  static const Color terracottaDark = Color(0xFFA2533A);
  static const Color mutedSage = Color(0xFFA9B9A0);
  static const Color mutedSageDark = Color(0xFF7D8E73);
  static const Color softBrass = Color(0xFFC4A05B);

  // Neutrals derived for text/surfaces on the ivory canvas.
  static const Color ink = Color(0xFF24281F);
  static const Color inkMuted = Color(0xFF5B5F52);
  static const Color divider = Color(0x331B4332);

  // Overlays used on top of photography so quote text stays legible.
  static const Color imageOverlayTop = Color(0x00000000);
  static const Color imageOverlayBottom = Color(0xCC12271D);

  static const LinearGradient photoOverlay = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [imageOverlayTop, imageOverlayBottom],
    stops: [0.45, 1.0],
  );
}
