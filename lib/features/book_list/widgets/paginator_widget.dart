import 'package:flutter/material.dart';
import 'package:hgraber_ui/features/book_list/bloc/book_list_bloc.dart';
import 'package:hgraber_ui/features/book_list/bloc/events.dart';
import 'package:hgraber_ui/features/book_list/bloc/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaginatorWidget extends StatelessWidget {
  final List<BooksPage> pages;
  final int bookOnPage;

  const PaginatorWidget({
    required this.pages,
    required this.bookOnPage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = List<Widget>.empty(growable: true);

    this.pages.forEach((page) {
      if (page.isSeparator) {
        // FIXME: поддержать разделители и текущую страницу
        return;
      }

      pages.add(TextButton(
          onPressed: () {
            context
                .read<BookListScreenBloc>()
                .add(LoadingBooksEvent(bookOnPage, page.value));
          },
          child: Text('${page.value}')));
    });

    return Wrap(children: pages);
  }
}
