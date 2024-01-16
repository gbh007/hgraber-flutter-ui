import 'package:flutter/material.dart';

import 'navigation.dart' show BottomNavigationBarWidget;

final class SimpleScaffold extends StatelessWidget {
  final String title;
  final Widget child;
  final Widget? floatingActionButton;

  const SimpleScaffold({
    required this.child,
    this.title = '',
    this.floatingActionButton,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: colorScheme.primaryContainer,
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
      body: child,
      floatingActionButton: floatingActionButton,
    );
  }
}

final class ErrorScaffold extends StatelessWidget {
  final String text;
  final String title;
  final Function()? onTap;

  const ErrorScaffold({
    this.text = 'Произошла неизвестная ошибка',
    this.title = '',
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return SimpleScaffold(
      title: title,
      floatingActionButton: onTap != null
          ? FloatingActionButton(
              onPressed: onTap,
              backgroundColor: colorScheme.secondaryContainer,
              child: const Icon(Icons.repeat_one),
            )
          : null,
      child: Container(
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
              text,
              style: textTheme.bodyMedium?.copyWith(color: colorScheme.error),
            ),
          ],
        ),
      ),
    );
  }
}

final class LoadingScaffold extends StatelessWidget {
  final String text;
  final String title;

  const LoadingScaffold({this.text = 'Загрузка', this.title = '', super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return SimpleScaffold(
      title: title,
      child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const CircularProgressIndicator.adaptive(),
            Text(
              text,
              style: textTheme.bodyMedium?.copyWith(color: colorScheme.primary),
            ),
          ],
        ),
      ),
    );
  }
}
