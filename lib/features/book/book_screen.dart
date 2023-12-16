import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hgraber_ui/repository/repository.dart';

import 'view.dart';
import 'book_bloc.dart';
import 'book_list_bloc.dart';

class BookScreen extends StatelessWidget {
  final int id;

  const BookScreen(
    this.id, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final client = RepositoryProvider.of<HGraberClient>(context);

    return BlocProvider(
      create: (_) => BookScreenBloc(client)..add(LoadingBookEvent(id)),
      child: BookView(id),
    );
  }
}

class BookListScreen extends StatelessWidget {
  const BookListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final client = RepositoryProvider.of<HGraberClient>(context);

    return BlocProvider(
      // FIXME: проброс глобальных настроек.
      create: (_) =>
          BookListScreenBloc(client)..add(LoadingBookListEvent(12, 0)),
      child: const BookListView(),
    );
  }
}
