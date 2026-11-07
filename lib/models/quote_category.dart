/// The three editorial photo categories bundled under assets/images.
/// Each quote is tagged with one, which drives both its background
/// photography and its section label.
enum QuoteCategory { nature, landscapes, architecture }

extension QuoteCategoryX on QuoteCategory {
  String get label {
    switch (this) {
      case QuoteCategory.nature:
        return 'Nature';
      case QuoteCategory.landscapes:
        return 'Landscapes';
      case QuoteCategory.architecture:
        return 'Architecture';
    }
  }

  String get folder {
    switch (this) {
      case QuoteCategory.nature:
        return 'nature';
      case QuoteCategory.landscapes:
        return 'landscapes';
      case QuoteCategory.architecture:
        return 'architecture';
    }
  }
}
