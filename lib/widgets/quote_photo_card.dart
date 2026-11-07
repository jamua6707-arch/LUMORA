import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';
import '../models/quote.dart';
import '../models/quote_category.dart';

/// Full-bleed editorial card: bundled photograph, bottom gradient for
/// legibility, category eyebrow, quote text, and author byline.
///
/// Falls back to a solid forest-green panel (with an icon) if the bundled
/// image asset is missing, so a broken asset never crashes the screen.
class QuotePhotoCard extends StatelessWidget {
  final Quote quote;
  final BorderRadius borderRadius;

  const QuotePhotoCard({
    super.key,
    required this.quote,
    this.borderRadius = const BorderRadius.all(Radius.circular(28)),
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            quote.imageAsset,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              color: AppColors.forestGreenDark,
              alignment: Alignment.center,
              child: const Icon(
                Icons.image_not_supported_outlined,
                color: AppColors.mutedSage,
                size: 48,
              ),
            ),
          ),
          DecoratedBox(
            decoration: const BoxDecoration(gradient: AppColors.photoOverlay),
          ),
          Positioned.fill(
            child: LayoutBuilder(
              builder: (context, constraints) {
                // Cap the text block so a long quote scrolls instead of
                // overflowing past the card's rounded clip on small screens.
                final maxTextHeight = constraints.maxHeight * 0.72;
                return Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 28),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxHeight: maxTextHeight),
                      child: SingleChildScrollView(
                        reverse: true,
                        physics: const ClampingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              quote.category.label.toUpperCase(),
                              style: AppTextStyles.eyebrow,
                            ),
                            const SizedBox(height: 14),
                            Text(
                              quote.text,
                              style: AppTextStyles.quoteDisplay,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              '— ${quote.author}',
                              style: AppTextStyles.author,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
