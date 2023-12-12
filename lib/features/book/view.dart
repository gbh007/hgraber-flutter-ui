import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hgraber_ui/widgets/navigation.dart';

import 'bloc.dart';
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
          return ErrorScreen(
            titleText: 'Книга',
            text: state.message,
            retray: () =>
                context.read<BookScreenBloc>().add(LoadingBookEvent(id)),
          );
        }

        if (state is BookScreenLoadedState) {
          final model = state.model;

          return SimpleScreen(
            titleText: 'Книга',
            body: BookWidget(model),
          );
        }

        return const LoadingScreen(titleText: 'Книга');
      },
    );
  }
}
