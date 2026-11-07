import 'quote_category.dart';

/// A single editorial quote paired with a category whose photography
/// provides its background.
class Quote {
  final String id;
  final String text;
  final String author;
  final QuoteCategory category;
  final String imageAsset;

  const Quote({
    required this.id,
    required this.text,
    required this.author,
    required this.category,
    required this.imageAsset,
  });
}
