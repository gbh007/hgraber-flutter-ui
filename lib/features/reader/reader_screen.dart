import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hgraber_ui/widgets/screen.dart';

import 'bloc.dart';
import 'widgets/reader_widget.dart';
import 'widgets/reader_navigation_widget.dart';

final class ReaderScreen extends StatelessWidget {
  final int id;
  final TextTheme textTheme;
  final ColorScheme colorScheme;

  const ReaderScreen({
    required this.id,
    required this.textTheme,
    required this.colorScheme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReaderScreenBloc, ReaderScreenState>(
      builder: (context, state) {
        if (state is ReaderScreenErrorState) {
          return ErrorScaffold(
            title: 'Читалка',
            text: state.message,
            onTap: () =>
                context.read<ReaderScreenBloc>().add(LoadingBookEvent(id)),
          );
        }

        if (state is ReaderScreenLoadedState) {
          return SimpleScaffold(
            title: state.book.name,
            floatingActionButton:
                ReaderNavigationWidget(pageCount: state.book.pageCount),
            child: ReaderWidget(
              book: state.book,
              updateRating: (page, rate) {
                context
                    .read<ReaderScreenBloc>()
                    .add(UpdateBookPageRatingEvent(id, page, rate));
              },
              colorScheme: colorScheme,
              textTheme: textTheme,
            ),
          );
        }

        return const LoadingScaffold(title: 'Читалка');
      },
    );
  }
}
