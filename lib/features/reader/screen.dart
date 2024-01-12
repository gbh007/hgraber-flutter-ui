import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hgraber_ui/repository/repository.dart' show Repository;
import 'package:hgraber_ui/widgets/screen.dart';

import 'bloc.dart';
import 'widget.dart';

class ReaderScreenAssembly extends StatelessWidget {
  final int id;
  final int? currentPage;

  const ReaderScreenAssembly({
    required this.id,
    this.currentPage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final client = RepositoryProvider.of<Repository>(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ReaderScreenBloc(client)..add(LoadingBookEvent(id)),
        ),
        BlocProvider(
          create: (_) => CurrentPageCubit(currentPage ?? 1),
        )
      ],
      child: ReaderScreen(id: id),
    );
  }
}

class ReaderScreen extends StatelessWidget {
  final int id;

  const ReaderScreen({
    required this.id,
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
            ),
          );
        }

        return const LoadingScaffold(title: 'Читалка');
      },
    );
  }
}
