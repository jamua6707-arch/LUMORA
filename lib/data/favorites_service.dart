import 'package:shared_preferences/shared_preferences.dart';
import '../core/constants/app_constants.dart';

/// Persists the set of favorited quote ids locally via SharedPreferences.
class FavoritesService {
  Set<String> _favoriteIds = {};
  bool _loaded = false;

  Future<void> load() async {
    if (_loaded) return;
    final prefs = await SharedPreferences.getInstance();
    _favoriteIds = (prefs.getStringList(AppConstants.favoritesPrefsKey) ?? [])
        .toSet();
    _loaded = true;
  }

  bool isFavorite(String quoteId) => _favoriteIds.contains(quoteId);

  Set<String> get favoriteIds => Set.unmodifiable(_favoriteIds);

  Future<bool> toggle(String quoteId) async {
    await load();
    final isNowFavorite = !_favoriteIds.contains(quoteId);
    if (isNowFavorite) {
      _favoriteIds.add(quoteId);
    } else {
      _favoriteIds.remove(quoteId);
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      AppConstants.favoritesPrefsKey,
      _favoriteIds.toList(),
    );
    return isNowFavorite;
  }
}
