import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hgraber_ui/features/book_list/widgets/book_list_widget.dart';
import 'package:hgraber_ui/features/book_list/widgets/paginator_widget.dart';
import 'bloc/events.dart';
import 'bloc/states.dart';

import 'package:hgraber_ui/widgets/screen.dart';

import 'bloc/book_list_bloc.dart';

class BookListScreen extends StatelessWidget {
  final TextTheme textTheme;
  final ColorScheme colorScheme;

  const BookListScreen({
    required this.textTheme,
    required this.colorScheme,
    super.key,
  });

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
                .add(LoadingBooksEvent(state.count, state.page)),
          );
        }

        if (state is BookListScreenLoadedState) {
          return SimpleScaffold(
            title: 'Книги',
            child: Column(
              children: [
                PaginatorWidget(pages: state.pages, bookOnPage: state.count),
                Expanded(
                  child: BookListWidget(
                    books: state.books,
                    count: state.count,
                    page: state.page,
                    colorScheme: colorScheme,
                    textTheme: textTheme,
                  ),
                ),
              ],
            ),
          );
        }

        return const LoadingScaffold(title: 'Книги');
      },
    );
  }
}
