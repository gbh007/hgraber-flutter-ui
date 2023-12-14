import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class _BottomNavigationBarWidget extends StatelessWidget {
  const _BottomNavigationBarWidget({super.key});

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
      bottomNavigationBar: const _BottomNavigationBarWidget(),
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}

class ErrorScreen extends StatelessWidget {
  final String? text;
  final String? titleText;
  final Function()? retray;

  const ErrorScreen({
    this.text,
    this.titleText,
    this.retray,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return SimpleScreen(
      titleText: titleText,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.warning_amber,
              color: colorScheme.error,
              size:
                  textTheme.headlineLarge?.fontSize, // FIXME: сделать нормально
            ),
            Text(
              'Ошибка',
              style: textTheme.bodyLarge?.copyWith(color: colorScheme.error),
            ),
            Text(
              text ?? 'Произошла неизвестная ошибка',
              style: textTheme.bodyMedium?.copyWith(color: colorScheme.error),
            ),
          ],
        ),
      ),
      floatingActionButton: retray != null
          ? FloatingActionButton(
              onPressed: retray,
              backgroundColor: colorScheme.secondaryContainer,
              child: const Icon(Icons.repeat_one),
            )
          : null,
    );
  }
}

class LoadingScreen extends StatelessWidget {
  final String? text;
  final String? titleText;

  const LoadingScreen({this.text, this.titleText});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return SimpleScreen(
      titleText: titleText,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const CircularProgressIndicator.adaptive(),
            Text(
              text ?? 'Загрузка',
              style: textTheme.bodyMedium?.copyWith(color: colorScheme.primary),
            ),
          ],
        ),
      ),
    );
  }
}
