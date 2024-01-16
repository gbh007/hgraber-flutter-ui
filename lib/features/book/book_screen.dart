import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hgraber_ui/features/book/bloc/events.dart';
import 'package:hgraber_ui/features/book/bloc/states.dart';
import 'package:hgraber_ui/features/book/widgets/book_pages_preview_widget.dart';

import 'package:hgraber_ui/widgets/screen.dart';

import 'bloc/book_bloc.dart';
import 'widgets/book_details_widget.dart';

class BookScreen extends StatelessWidget {
  final int id;
  final TextTheme textTheme;
  final ColorScheme colorScheme;

  const BookScreen({
    required this.id,
    required this.textTheme,
    required this.colorScheme,
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
          return SimpleScaffold(
            title: 'Книга',
            child: Column(
              children: <Widget>[
                BookDetailsWidget(
                  book: state.book,
                  updateRate: (rate) {
                    context.read<BookScreenBloc>().add(RateBookEvent(id, rate));
                  },
                  colorScheme: colorScheme,
                  textTheme: textTheme,
                ),
                Expanded(
                  child: BookPagesPreviewWidget(
                    pages: state.book.pages,
                    updateRate: (page, rate) {
                      context
                          .read<BookScreenBloc>()
                          .add(RateBookPageEvent(id, page, rate));
                    },
                    onTap: (pageNumber) =>
                        context.go('/book/$id/read/$pageNumber'),
                    colorScheme: colorScheme,
                    textTheme: textTheme,
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
