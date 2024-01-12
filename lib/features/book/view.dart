import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:hgraber_ui/widgets/screen.dart';

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
          return ErrorScaffold(
            title: 'Книга',
            text: state.message,
            onTap: () =>
                context.read<BookScreenBloc>().add(LoadingBookEvent(id)),
          );
        }

        if (state is BookScreenLoadedState) {
          final model = state.model;

          return SimpleScaffold(
            title: 'Книга',
            child: Column(
              children: <Widget>[
                BookDetailsWidget(
                  model,
                  updateRate: (rate) {
                    context.read<BookScreenBloc>().add(RateBookEvent(id, rate));
                  },
                ),
                Expanded(
                  child: BookImageListWidget(
                    model.pages ?? List.empty(), // FIXME: вообще не рендерить
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

        return const LoadingScaffold(title: 'Книга');
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
          return ErrorScaffold(
            title: 'Книги',
            text: state.message,
            onTap: () => context
                .read<BookListScreenBloc>()
                .add(LoadingBookListEvent(state.count, state.page)),
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
                  child: BookShortInfoWidget(
                    book,
                    updateRate: (rate) {
                      context.read<BookListScreenBloc>().add(RateBookListEvent(
                          state.count, state.page, book.id, rate));
                    },
                  ),
                ),
              )
              .toList();

          final List<Widget> pages = List<Widget>.empty(growable: true);

          state.pages.forEach((page) {
            if (page.isSeparator) {
              // FIXME: поддержать разделители и текущую страницу
              return;
            }

            pages.add(TextButton(
                onPressed: () {
                  context
                      .read<BookListScreenBloc>()
                      .add(LoadingBookListEvent(state.count, page.value));
                },
                child: Text('${page.value}')));
          });

          if (isVertical || bookOnRow == 1) {
            return SimpleScaffold(
              title: 'Книги',
              child: Column(
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

          return SimpleScaffold(
            title: 'Книги',
            child: Column(
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

        return const LoadingScaffold(title: 'Книга');
      },
    );
  }
}
