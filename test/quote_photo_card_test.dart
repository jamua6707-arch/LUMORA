import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:lumora/models/quote.dart';
import 'package:lumora/models/quote_category.dart';
import 'package:lumora/widgets/quote_photo_card.dart';

void main() {
  testWidgets(
    'long quote text stays within the card bounds even with large '
    'accessibility text scaling',
    (tester) async {
      final longQuote = Quote(
        id: 'a09',
        text:
            'A great building must begin with the unmeasurable, must go '
            'through measurable means when it is being designed, and in the '
            'end must be unmeasurable.',
        author: 'Louis Kahn',
        category: QuoteCategory.architecture,
        imageAsset: 'assets/images/architecture/architecture_01.jpg',
      );

      // Mimics a small phone (e.g. iPhone SE-class card area) with a user
      // who has cranked up system text scaling for accessibility — the
      // realistic way this card's text can outgrow its available space.
      await tester.pumpWidget(
        MaterialApp(
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: const TextScaler.linear(2.5)),
            child: child!,
          ),
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: 350,
                height: 480,
                child: QuotePhotoCard(quote: longQuote),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final cardRect = tester.getRect(find.byType(QuotePhotoCard));
      final scrollRect =
          tester.getRect(find.byType(SingleChildScrollView));

      // The scrollable text region itself (which clips its own overflow)
      // must stay inside the card — not be pushed above/past the card's
      // own ClipRRect, which would silently and unrecoverably hide text.
      expect(scrollRect.top, greaterThanOrEqualTo(cardRect.top - 0.5));
      expect(scrollRect.bottom, lessThanOrEqualTo(cardRect.bottom + 0.5));
    },
  );
}
