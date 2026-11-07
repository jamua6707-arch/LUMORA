import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';

/// Generic centered empty-state: icon, title, supporting body copy.
class EmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String body;

  const EmptyState({
    super.key,
    required this.icon,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 56, color: AppColors.mutedSageDark),
            const SizedBox(height: 20),
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyles.screenTitle.copyWith(fontSize: 22),
            ),
            const SizedBox(height: 10),
            Text(
              body,
              textAlign: TextAlign.center,
              style: AppTextStyles.body.copyWith(color: AppColors.inkMuted),
            ),
          ],
        ),
      ),
    );
  }
}
