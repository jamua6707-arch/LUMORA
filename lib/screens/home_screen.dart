import 'package:flutter/material.dart';
import '../core/constants/app_constants.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';
import '../data/app_state.dart';
import '../widgets/quote_action_bar.dart';
import '../widgets/quote_photo_card.dart';

/// Primary screen: today's quote, full-bleed photography, and the
/// favorite/copy/share/next action row.
class HomeScreen extends StatelessWidget {
  final AppState appState;

  const HomeScreen({super.key, required this.appState});

  @override
  Widget build(BuildContext context) {
    final quote = appState.currentQuote;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppConstants.appName, style: AppTextStyles.screenTitle),
            const SizedBox(height: 2),
            Text(
              AppConstants.tagline,
              style: AppTextStyles.caption.copyWith(
                color: AppColors.inkMuted,
              ),
            ),
            const SizedBox(height: 18),
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 420),
                switchInCurve: Curves.easeOutCubic,
                switchOutCurve: Curves.easeInCubic,
                transitionBuilder: (child, animation) => FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, 0.03),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  ),
                ),
                child: QuotePhotoCard(
                  key: ValueKey(quote.id),
                  quote: quote,
                ),
              ),
            ),
            const SizedBox(height: 16),
            QuoteActionBar(
              quote: quote,
              isFavorite: appState.isFavorite(quote.id),
              onToggleFavorite: () => appState.toggleFavorite(quote.id),
              onNext: appState.nextQuote,
            ),
          ],
        ),
      ),
    );
  }
}
