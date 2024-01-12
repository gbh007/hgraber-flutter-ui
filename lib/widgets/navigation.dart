import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouterState routeState = GoRouterState.of(context);
    final int index = switch (routeState.path ?? '/') {
      '/book' => 1,
      '/settings' => 2,
      _ => 0
    };

    return BottomNavigationBar(
      useLegacyColorScheme: false,
      currentIndex: index,
      onTap: (value) {
        switch (value) {
          case 0:
            context.go("/");
          case 1:
            context.go("/book");
          case 2:
            context.go("/settings");
          default:
            context.go("/");
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Главная'),
        BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Книги'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Настройки'),
      ],
    );
  }
}
