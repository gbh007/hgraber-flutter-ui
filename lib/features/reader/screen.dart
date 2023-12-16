import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hgraber_ui/features/reader/view.dart';

import 'package:hgraber_ui/repository/repository.dart';

import 'bloc.dart';

class ReaderScreen extends StatelessWidget {
  final int id;
  final int? currentPage;

  const ReaderScreen(
    this.id, {
    this.currentPage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final client = RepositoryProvider.of<HGraberClient>(context);

    return BlocProvider(
      create: (_) =>
          ReaderScreenBloc(client)..add(LoadingBookEvent(id, currentPage ?? 1)),
      child: ReaderView(id),
    );
  }
}
