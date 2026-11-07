import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Editorial-magazine style type scale. Headline styles lean on wide
/// letter-spacing + light weight; UI styles stay compact and legible.
class AppTextStyles {
  AppTextStyles._();

  static const String _display = 'serif';

  static const TextStyle quoteDisplay = TextStyle(
    fontFamily: _display,
    fontSize: 28,
    height: 1.35,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
    color: AppColors.warmIvory,
    letterSpacing: 0.2,
  );

  static const TextStyle quoteDisplayDark = TextStyle(
    fontFamily: _display,
    fontSize: 28,
    height: 1.35,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
    color: AppColors.ink,
    letterSpacing: 0.2,
  );

  static const TextStyle author = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.6,
    color: AppColors.warmIvory,
  );

  static const TextStyle authorDark = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.6,
    color: AppColors.inkMuted,
  );

  static const TextStyle eyebrow = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    letterSpacing: 3.0,
    color: AppColors.softBrass,
  );

  static const TextStyle screenTitle = TextStyle(
    fontFamily: _display,
    fontSize: 32,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.italic,
    color: AppColors.forestGreen,
  );

  static const TextStyle sectionLabel = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    letterSpacing: 2.2,
    color: AppColors.inkMuted,
  );

  static const TextStyle body = TextStyle(
    fontSize: 15,
    height: 1.5,
    color: AppColors.ink,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12,
    color: AppColors.inkMuted,
  );
}
