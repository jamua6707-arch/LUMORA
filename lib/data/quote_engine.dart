import 'dart:math';
import '../models/quote.dart';
import 'quotes_data.dart';

/// Hands out random quotes while avoiding an immediate repeat of the
/// previously shown quote whenever more than one quote is available.
class QuoteEngine {
  final Random _random;
  final List<Quote> _pool;
  Quote? _current;

  QuoteEngine({List<Quote>? pool, Random? random})
      : _pool = pool ?? quotes,
        _random = random ?? Random();

  Quote get current => _current ??= _pickNext();

  Quote next() {
    _current = _pickNext();
    return _current!;
  }

  Quote _pickNext() {
    if (_pool.isEmpty) {
      throw StateError('QuoteEngine has no quotes to choose from.');
    }
    if (_pool.length == 1) {
      return _pool.first;
    }
    Quote candidate;
    do {
      candidate = _pool[_random.nextInt(_pool.length)];
    } while (candidate.id == _current?.id);
    return candidate;
  }
}
