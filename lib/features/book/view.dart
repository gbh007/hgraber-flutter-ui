import 'dart:math';

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
            body: Column(
              children: <Widget>[
                BookWidget(
                  model,
                  updateRate: (rate) {
                    context.read<BookScreenBloc>().add(RateBookEvent(id, rate));
                  },
                ),
                Expanded(
                  child: BookImageListWidget(
                    model,
                    updateRate: (page, rate) {
                      context
                          .read<BookScreenBloc>()
                          .add(RateBookPageEvent(id, page, rate));
                    },
                    onTap: (pageNumber) =>
                        context.go('/book/$id/read/$pageNumber'),
                  ),
                ),
              ],
            ),
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
            titleText: 'Книги',
            text: state.message,
            retray: () => context
                .read<BookListScreenBloc>()
                .add(LoadingBookListEvent(state.count, state.offset)),
          );
        }

        if (state is BookListScreenLoadedState) {
          final model = state.model;
          final bool isVertical =
              MediaQuery.of(context).orientation == Orientation.portrait;
          final int bookOnRow =
              max(1, (MediaQuery.of(context).size.width / 800).floor());

          final books = model
              .map(
                (book) => InkWell(
                  onTap: () => context.go('/book/${book.id}'),
                  child: BookWidget(
                    book,
                    updateRate: (rate) {
                      context.read<BookListScreenBloc>().add(RateBookListEvent(
                          state.count, state.offset, book.id, rate));
                    },
                  ),
                ),
              )
              .toList();

          final int pageCount =
              (state.totalBookCount.toDouble() / state.count.toDouble()).ceil();
          final List<Widget> pages = List<Widget>.empty(growable: true);

          for (var i = 0; i < pageCount; i++) {
            pages.add(TextButton(
                onPressed: () {
                  context
                      .read<BookListScreenBloc>()
                      .add(LoadingBookListEvent(state.count, state.count * i));
                },
                child: Text('${i + 1}')));
          }

          if (isVertical || bookOnRow == 1) {
            return SimpleScreen(
              titleText: 'Книги',
              body: Column(
                children: [
                  Wrap(children: pages),
                  Expanded(
                    child: ListView(
                      children: books,
                    ),
                  ),
                ],
              ),
            );
          }

          return SimpleScreen(
            titleText: 'Книги',
            body: Column(
              children: [
                Wrap(children: pages),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: bookOnRow,
                    childAspectRatio: 2,
                    children: books,
                  ),
                ),
              ],
            ),
          );
        }

        return const LoadingScreen(titleText: 'Книга');
      },
    );
  }
}
