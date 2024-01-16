import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hgraber_ui/repository/repository.dart' show Repository;

import 'bloc.dart';
import 'reader_screen.dart';

final class ReaderScreenAssembly extends StatelessWidget {
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
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ReaderScreenBloc(client)..add(LoadingBookEvent(id)),
        ),
        BlocProvider(
          create: (_) => CurrentPageCubit(currentPage ?? 1),
        )
      ],
      child: ReaderScreen(
        id: id,
        colorScheme: colorScheme,
        textTheme: textTheme,
      ),
    );
  }
}
