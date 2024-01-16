import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hgraber_ui/features/book/bloc/events.dart';

import 'package:hgraber_ui/repository/repository.dart';

import 'book_screen.dart';
import 'bloc/book_bloc.dart';

class BookScreenAssembly extends StatelessWidget {
  final int id;

  const BookScreenAssembly({
    required this.id,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final client = RepositoryProvider.of<Repository>(context);
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return BlocProvider(
      create: (_) => BookScreenBloc(client)..add(LoadingBookEvent(id)),
      child: BookScreen(
        id: id,
        colorScheme: colorScheme,
        textTheme: textTheme,
      ),
    );
  }
}
