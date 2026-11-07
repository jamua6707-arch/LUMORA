import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

/// Single source of truth for the app's [ThemeData]. Screens and widgets
/// should pull colors/styles from [AppColors]/[AppTextStyles] via this
/// theme rather than hardcoding values.
class AppTheme {
  AppTheme._();

  static ThemeData get light {
    final base = ThemeData.light(useMaterial3: true);

    return base.copyWith(
      scaffoldBackgroundColor: AppColors.warmIvory,
      colorScheme: base.colorScheme.copyWith(
        primary: AppColors.forestGreen,
        onPrimary: AppColors.warmIvory,
        secondary: AppColors.terracotta,
        onSecondary: AppColors.warmIvory,
        tertiary: AppColors.softBrass,
        surface: AppColors.warmIvory,
        onSurface: AppColors.ink,
        error: AppColors.terracottaDark,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.warmIvory,
        foregroundColor: AppColors.forestGreen,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: AppTextStyles.screenTitle,
        iconTheme: IconThemeData(color: AppColors.forestGreen),
      ),
      textTheme: base.textTheme.copyWith(
        headlineMedium: AppTextStyles.screenTitle,
        titleMedium: AppTextStyles.sectionLabel,
        bodyMedium: AppTextStyles.body,
        bodySmall: AppTextStyles.caption,
        labelLarge: AppTextStyles.authorDark,
      ),
      iconTheme: const IconThemeData(color: AppColors.forestGreen, size: 24),
      dividerTheme: const DividerThemeData(
        color: AppColors.divider,
        thickness: 1,
        space: 24,
      ),
      splashColor: AppColors.mutedSage.withValues(alpha: 0.2),
      highlightColor: Colors.transparent,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.warmIvory,
        selectedItemColor: AppColors.forestGreen,
        unselectedItemColor: AppColors.inkMuted,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.forestGreen,
        contentTextStyle: AppTextStyles.body.copyWith(
          color: AppColors.warmIvory,
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
