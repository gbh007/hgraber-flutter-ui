import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hgraber_ui/common/global.dart';
import 'package:hgraber_ui/features/book_list/bloc/events.dart';
import 'package:hgraber_ui/repository/repository.dart';

import 'book_list_screen.dart';
import 'bloc/book_list_bloc.dart';

class BookListScreenAssembly extends StatelessWidget {
  const BookListScreenAssembly({super.key});

  @override
  Widget build(BuildContext context) {
    final client = RepositoryProvider.of<Repository>(context);
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<GlobalBloc, GlobalModel>(builder: (context, state) {
      return BlocProvider(
        create: (_) => BookListScreenBloc(client)
          ..add(LoadingBooksEvent(state.bookOnPage, 0)),
        child: BookListScreen(
          colorScheme: colorScheme,
          textTheme: textTheme,
        ),
      );
    });
  }
}
