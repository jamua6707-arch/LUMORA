import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/constants/app_constants.dart';
import '../models/quote.dart';
import 'favorites_service.dart';
import 'quote_engine.dart';
import 'quotes_data.dart';

/// Single root [ChangeNotifier] gluing together the quote engine and the
/// favorites store. Widgets listen via [ListenableBuilder].
class AppState extends ChangeNotifier {
  final QuoteEngine _engine = QuoteEngine();
  final FavoritesService _favorites = FavoritesService();

  Quote _currentQuote;
  bool _ready = false;

  AppState() : _currentQuote = QuoteEngine().current;

  bool get isReady => _ready;

  Future<void> init() async {
    await _favorites.load();

    final prefs = await SharedPreferences.getInstance();
    final lastId = prefs.getString(AppConstants.lastQuoteIdPrefsKey);
    if (lastId != null) {
      for (final q in quotes) {
        if (q.id == lastId) {
          _currentQuote = q;
          break;
        }
      }
    }

    _ready = true;
    notifyListeners();
  }

  Quote get currentQuote => _currentQuote;

  void nextQuote() {
    _currentQuote = _engine.next();
    _persistCurrentQuote();
    notifyListeners();
  }

  Future<void> _persistCurrentQuote() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppConstants.lastQuoteIdPrefsKey, _currentQuote.id);
  }

  bool isFavorite(String quoteId) => _favorites.isFavorite(quoteId);

  Future<void> toggleFavorite(String quoteId) async {
    await _favorites.toggle(quoteId);
    notifyListeners();
  }

  List<Quote> get favoriteQuotes =>
      quotes.where((q) => _favorites.isFavorite(q.id)).toList();
}
