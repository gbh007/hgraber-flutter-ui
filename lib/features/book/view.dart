import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: <Widget>[
        Expanded(
          child: BlocBuilder<BookScreenBloc, BookScreenState>(
            builder: (context, state) {
              if (state is BookScreenErrorState) {
                return Center(
                  child: Text(state.message,
                      style: textTheme.bodyMedium
                          ?.copyWith(color: colorScheme.error)),
                );
              }

              if (state is BookScreenLoadedState) {
                final model = state.model;

                return BookWidget(model);
              }

              return const CircularProgressIndicator.adaptive();
            },
          ),
        ),
        FloatingActionButton(
          child: const Icon(Icons.arrow_back_sharp),
          onPressed: () => context.pop(),
        ),
      ],
    );
  }
}
