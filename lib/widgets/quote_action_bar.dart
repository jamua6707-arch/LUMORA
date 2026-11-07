import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import '../core/theme/app_colors.dart';
import '../models/quote.dart';

/// Favorite / copy / share / next actions for the quote currently on
/// screen. Icons stay in a single outline family for visual consistency.
class QuoteActionBar extends StatelessWidget {
  final Quote quote;
  final bool isFavorite;
  final VoidCallback onToggleFavorite;
  final VoidCallback onNext;

  const QuoteActionBar({
    super.key,
    required this.quote,
    required this.isFavorite,
    required this.onToggleFavorite,
    required this.onNext,
  });

  Future<void> _copy(BuildContext context) async {
    await Clipboard.setData(
      ClipboardData(text: '"${quote.text}" — ${quote.author}'),
    );
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Quote copied to clipboard')),
    );
  }

  Future<void> _share(BuildContext context) async {
    await Share.share('"${quote.text}" — ${quote.author}\n\nLumora');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _ActionButton(
          icon: isFavorite ? Icons.favorite_rounded : Icons.favorite_border,
          color: isFavorite ? AppColors.terracotta : AppColors.forestGreen,
          label: isFavorite ? 'Saved' : 'Save',
          onTap: onToggleFavorite,
        ),
        _ActionButton(
          icon: Icons.copy_rounded,
          color: AppColors.forestGreen,
          label: 'Copy',
          onTap: () => _copy(context),
        ),
        _ActionButton(
          icon: Icons.ios_share_rounded,
          color: AppColors.forestGreen,
          label: 'Share',
          onTap: () => _share(context),
        ),
        _ActionButton(
          icon: Icons.refresh_rounded,
          color: AppColors.forestGreen,
          label: 'Next',
          onTap: onNext,
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.color,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 26),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
