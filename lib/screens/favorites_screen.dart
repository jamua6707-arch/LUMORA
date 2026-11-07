import 'package:flutter/material.dart';
import '../core/constants/app_constants.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';
import '../data/app_state.dart';
import '../models/quote.dart';
import '../models/quote_category.dart';
import '../widgets/empty_state.dart';

/// Lists every quote the reader has saved, newest-tap-first not required —
/// order simply follows the underlying quote catalogue.
class FavoritesScreen extends StatelessWidget {
  final AppState appState;

  const FavoritesScreen({super.key, required this.appState});

  @override
  Widget build(BuildContext context) {
    final favorites = appState.favoriteQuotes;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Favorites', style: AppTextStyles.screenTitle),
            const SizedBox(height: 4),
            Text(
              '${favorites.length} saved',
              style: AppTextStyles.caption.copyWith(
                color: AppColors.inkMuted,
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: favorites.isEmpty
                  ? const EmptyState(
                      icon: Icons.favorite_border,
                      title: AppConstants.emptyFavoritesTitle,
                      body: AppConstants.emptyFavoritesBody,
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.only(bottom: 20),
                      itemCount: favorites.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final quote = favorites[index];
                        return _FavoriteTile(
                          quote: quote,
                          onRemove: () =>
                              appState.toggleFavorite(quote.id),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FavoriteTile extends StatelessWidget {
  final Quote quote;
  final VoidCallback onRemove;

  const _FavoriteTile({required this.quote, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.warmIvoryDeep,
        borderRadius: BorderRadius.circular(18),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              quote.imageAsset,
              width: 56,
              height: 56,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 56,
                height: 56,
                color: AppColors.forestGreenDark,
                child: const Icon(
                  Icons.image_not_supported_outlined,
                  color: AppColors.mutedSage,
                  size: 20,
                ),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  quote.category.label.toUpperCase(),
                  style: AppTextStyles.eyebrow.copyWith(fontSize: 10),
                ),
                const SizedBox(height: 6),
                Text(
                  quote.text,
                  style: AppTextStyles.quoteDisplayDark.copyWith(
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  '— ${quote.author}',
                  style: AppTextStyles.authorDark.copyWith(fontSize: 11),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.favorite_rounded),
            color: AppColors.terracotta,
            onPressed: onRemove,
          ),
        ],
      ),
    );
  }
}
