import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:hgraber_ui/widgets/navigation.dart';

import 'book_bloc.dart';
import 'book_list_bloc.dart';
import 'widget.dart';

class BookView extends StatelessWidget {
  final int id;

  const BookView(
    this.id, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookScreenBloc, BookScreenState>(
      builder: (context, state) {
        if (state is BookScreenErrorState) {
          return ErrorScreen(
            titleText: 'Книга',
            text: state.message,
            retray: () =>
                context.read<BookScreenBloc>().add(LoadingBookEvent(id)),
          );
        }

        if (state is BookScreenLoadedState) {
          final model = state.model;

          return SimpleScreen(
            titleText: 'Книга',
            body: BookWidget(model),
          );
        }

        return const LoadingScreen(titleText: 'Книга');
      },
    );
  }
}

class BookListView extends StatelessWidget {
  const BookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookListScreenBloc, BookListScreenState>(
      builder: (context, state) {
        if (state is BookListScreenErrorState) {
          return ErrorScreen(
            titleText: 'Книга',
            text: state.message,
            // FIXME: использовать глобальные данные
            retray: () => context
                .read<BookListScreenBloc>()
                .add(LoadingBookListEvent(12, 0)),
          );
        }

        if (state is BookListScreenLoadedState) {
          final model = state.model;

          return SimpleScreen(
            titleText: 'Книга',
            body: ListView(
              children: model
                  .map(
                    (book) => BookWidget(
                      book,
                      addons: <Widget>[
                        TextButton(
                            onPressed: () => context.go('/book/${book.id}'),
                            child: const Text('Подробнее'))
                      ],
                    ),
                  )
                  .toList(),
            ),
          );
        }

        return const LoadingScreen(titleText: 'Книга');
      },
    );
  }
}
