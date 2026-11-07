import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:lumora/core/constants/app_constants.dart';
import 'package:lumora/data/app_state.dart';
import 'package:lumora/main.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  Future<AppState> buildReadyAppState() async {
    final appState = AppState();
    await appState.init();
    return appState;
  }

  testWidgets('shows the app name and a quote on launch', (tester) async {
    final appState = await buildReadyAppState();
    await tester.pumpWidget(LumoraApp(appState: appState));
    await tester.pumpAndSettle();

    expect(find.text(AppConstants.appName), findsOneWidget);
    expect(find.text(appState.currentQuote.text), findsOneWidget);
  });

  testWidgets('tapping Save marks the current quote as a favorite',
      (tester) async {
    final appState = await buildReadyAppState();
    await tester.pumpWidget(LumoraApp(appState: appState));
    await tester.pumpAndSettle();

    expect(appState.isFavorite(appState.currentQuote.id), isFalse);

    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();

    expect(appState.isFavorite(appState.currentQuote.id), isTrue);
    expect(find.text('Saved'), findsOneWidget);
  });

  testWidgets('favorites tab lists saved quotes and shows empty state '
      'otherwise', (tester) async {
    final appState = await buildReadyAppState();
    await tester.pumpWidget(LumoraApp(appState: appState));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Favorites'));
    await tester.pumpAndSettle();
    expect(find.text(AppConstants.emptyFavoritesTitle), findsOneWidget);

    await tester.tap(find.text('Today'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Favorites'));
    await tester.pumpAndSettle();
    expect(find.text(AppConstants.emptyFavoritesTitle), findsNothing);
    expect(find.text(appState.currentQuote.text), findsOneWidget);
  });

  testWidgets('tapping Next shows a different quote', (tester) async {
    final appState = await buildReadyAppState();
    await tester.pumpWidget(LumoraApp(appState: appState));
    await tester.pumpAndSettle();

    final firstQuoteId = appState.currentQuote.id;

    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();

    expect(appState.currentQuote.id, isNot(equals(firstQuoteId)));
  });
}
