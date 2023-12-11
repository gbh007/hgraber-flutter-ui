import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class _BottomNavigationBarWidget extends StatelessWidget {
  const _BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouterState routeState = GoRouterState.of(context);
    final int index = switch (routeState.path ?? '/') {
      '/books' => 1,
      '/settings' => 2,
      '/book/:id' => 3,
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
            context.go("/books");
          case 2:
            context.go("/settings");
          case 3:
            context.go("/book/1");
          default:
            context.go("/");
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Главная',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Книги'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Настройки'),
        BottomNavigationBarItem(icon: Icon(Icons.auto_fix_high), label: 'Test'),
      ],
    );
  }
}

class SimpleScreen extends StatelessWidget {
  final String? titleText;
  final Widget body;
  final Widget? floatingActionButton;

  const SimpleScreen({
    required this.body,
    this.titleText,
    this.floatingActionButton,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(titleText ?? ''),
        backgroundColor: colorScheme.primaryContainer,
      ),
      bottomNavigationBar: _BottomNavigationBarWidget(),
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}
