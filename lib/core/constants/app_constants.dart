/// App-wide static constants: copy strings and asset path roots.
class AppConstants {
  AppConstants._();

  static const String appName = 'Lumora';
  static const String tagline = 'A quiet word, every day.';

  static const String favoritesPrefsKey = 'lumora_favorite_quote_ids';
  static const String lastQuoteIdPrefsKey = 'lumora_last_quote_id';

  static const String emptyFavoritesTitle = 'No favorites yet';
  static const String emptyFavoritesBody =
      'Tap the heart on a quote that speaks to you and it will '
      'appear here.';

  static const String fallbackImageAsset = 'assets/images/nature/nature_01.jpg';
}
