import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hgraber_ui/repository/repository.dart';

import 'package:hgraber_ui/widgets/navigation.dart';
import 'package:hgraber_ui/widgets/rate.dart';

import 'bloc.dart';
import 'widget.dart';

class ReaderView extends StatelessWidget {
  final int id;

  const ReaderView(
    this.id, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReaderScreenBloc, ReaderScreenState>(
      builder: (context, state) {
        if (state is ReaderScreenErrorState) {
          return ErrorScreen(
            titleText: 'Читалка',
            text: state.message,
            retray: () => context
                .read<ReaderScreenBloc>()
                .add(LoadingBookEvent(id, state.currentPage)),
          );
        }

        if (state is ReaderScreenLoadedState) {
          return BlocProvider(
            create: (_) => CurrentPageCubit(state.currentPage),
            child: ReaderPageView(
              state.model,
              updateRate: (page, rate) {
                context
                    .read<ReaderScreenBloc>()
                    .add(RateBookPageEvent(id, page, rate));
              },
            ),
          );
        }

        return const LoadingScreen(titleText: 'Читалка');
      },
    );
  }
}

class ReaderPageView extends StatelessWidget {
  final Book model;
  final void Function(int page, int rate)? updateRate;

  const ReaderPageView(
    this.model, {
    this.updateRate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentPageCubit, int>(builder: (context, state) {
      final currentPage = max(1, min(state, model.pages.length));
      final page = model.pages.elementAtOrNull(currentPage - 1);
      final textTheme = Theme.of(context).textTheme;

      return SimpleScreen(
        titleText: model.info.name ?? 'Читалка',
        body: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Страница $currentPage из ${model.pages.length}',
                    style: textTheme.bodyLarge,
                  ),
                  RateWidget(
                    page?.rate ?? 0,
                    updateRate: (rate) {
                      if (page == null || updateRate == null) {
                        return;
                      }

                      updateRate!(page.pageNumber, rate);
                    },
                  ),
                ],
              ),
              Expanded(
                child: ImageWidget(
                  page?.urlToView,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: FloatingActionButton(
                heroTag: "back",
                onPressed: () {
                  if (currentPage > 1) {
                    context.read<CurrentPageCubit>().back();
                  }
                },
                child: const Icon(Icons.arrow_back),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: FloatingActionButton(
                heroTag: "forward",
                onPressed: () {
                  if (currentPage < model.pages.length) {
                    context.read<CurrentPageCubit>().forward();
                  }
                },
                child: const Icon(Icons.arrow_forward),
              ),
            ),
          ],
        ),
      );
    });
  }
}
