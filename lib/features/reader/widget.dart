import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hgraber_ui/widgets/rate.dart';

import 'bloc.dart';
import 'model.dart';

class ReaderWidget extends StatelessWidget {
  final Book book;
  final void Function(int page, int rating)? updateRating;

  const ReaderWidget({
    required this.book,
    this.updateRating,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentPageCubit, int>(builder: (context, state) {
      final page = book.pages.elementAtOrNull(state - 1);
      final textTheme = Theme.of(context).textTheme;

      return Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Страница $state из ${book.pageCount}',
                  style: textTheme.bodyLarge,
                ),
                RateWidget(
                  page?.rating ?? 0,
                  updateRating: (rating) {
                    if (page == null || updateRating == null) {
                      return;
                    }

                    updateRating!(page.pageNumber, rating);
                  },
                ),
              ],
            ),
            Expanded(child: ImageWidget(page?.previewUrl)),
          ],
        ),
      );
    });
  }
}

class ReaderNavigationWidget extends StatelessWidget {
  final int pageCount;

  const ReaderNavigationWidget({
    required this.pageCount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentPageCubit, int>(builder: (context, state) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: FloatingActionButton(
              heroTag: "back",
              onPressed: () {
                context.read<CurrentPageCubit>().back(pageCount);
              },
              child: const Icon(Icons.arrow_back),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: FloatingActionButton(
              heroTag: "forward",
              onPressed: () {
                context.read<CurrentPageCubit>().forward(pageCount);
              },
              child: const Icon(Icons.arrow_forward),
            ),
          ),
        ],
      );
    });
  }
}

class ImageWidget extends StatelessWidget {
  final String? url;

  const ImageWidget(
    this.url, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    if (url != null) {
      return Image.network(
        url!,
        fit: BoxFit.contain,
      );
    }

    // FIXME: заменить на картинку ассет.
    return Text(
      'no image',
      style: textTheme.bodyMedium?.copyWith(
        color: colorScheme.onError,
        backgroundColor: colorScheme.onErrorContainer,
      ),
    );
  }
}
