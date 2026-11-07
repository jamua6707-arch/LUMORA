import 'package:flutter/material.dart';
import '../data/app_state.dart';
import 'favorites_screen.dart';
import 'home_screen.dart';

/// Hosts bottom navigation between the daily-quote screen and favorites.
class RootShell extends StatefulWidget {
  final AppState appState;

  const RootShell({super.key, required this.appState});

  @override
  State<RootShell> createState() => _RootShellState();
}

class _RootShellState extends State<RootShell> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListenableBuilder(
        listenable: widget.appState,
        builder: (context, _) => IndexedStack(
          index: _index,
          children: [
            HomeScreen(appState: widget.appState),
            FavoritesScreen(appState: widget.appState),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_stories_outlined),
            activeIcon: Icon(Icons.auto_stories_rounded),
            label: 'Today',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            activeIcon: Icon(Icons.favorite_rounded),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
