import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hgraber_ui/features/book_list/bloc/book_list_bloc.dart';
import 'package:hgraber_ui/features/book_list/bloc/events.dart';
import 'package:hgraber_ui/features/book_list/bloc/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hgraber_ui/features/book_list/widgets/book_short_info_widget.dart';

class BookListWidget extends StatelessWidget {
  final List<Book> books;
  final int count, page;
  final TextTheme textTheme;
  final ColorScheme colorScheme;

  const BookListWidget({
    required this.books,
    required this.count,
    required this.page,
    required this.textTheme,
    required this.colorScheme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // FIXME: а это куда лучше размешать?
    final bool isVertical =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final int bookOnRow =
        max(1, (MediaQuery.of(context).size.width / 800).floor());

    final books = this
        .books
        .map(
          (book) => InkWell(
            onTap: () => context.go('/book/${book.info.id}'),
            child: BookShortInfoWidget(
              book: book,
              updateRate: (rate) {
                context.read<BookListScreenBloc>().add(
                      RateBookEvent(
                        count,
                        page,
                        book.info.id,
                        rate,
                      ),
                    );
              },
              colorScheme: colorScheme,
              textTheme: textTheme,
            ),
          ),
        )
        .toList();

    if (isVertical || bookOnRow == 1) {
      return ListView(
        children: books,
      );
    }

    return GridView.count(
      crossAxisCount: bookOnRow,
      childAspectRatio: 2,
      children: books,
    );
  }
}
