import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hgraber_ui/repository/repository.dart';

import 'view.dart';
import 'bloc.dart';

class BookScreen extends StatelessWidget {
  final int id;

  const BookScreen(
    this.id, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final client = RepositoryProvider.of<HGraberClient>(context);

    return BlocProvider(
      create: (_) => BookScreenBloc(client)..add(LoadingBookEvent(id)),
      child: BookView(id),
    );
  }
}
