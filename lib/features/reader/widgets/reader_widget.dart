import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hgraber_ui/widgets/rate.dart';

import '../bloc.dart';
import '../model.dart';
import 'image_widget.dart';

class ReaderWidget extends StatelessWidget {
  final Book book;
  final void Function(int page, int rating)? updateRating;
  final TextTheme textTheme;
  final ColorScheme colorScheme;

  const ReaderWidget({
    required this.book,
    required this.textTheme,
    required this.colorScheme,
    this.updateRating,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentPageCubit, int>(builder: (context, state) {
      final page = book.pages.elementAtOrNull(state - 1);

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
            Expanded(
              child: ImageWidget(
                url: page?.previewUrl,
                colorScheme: colorScheme,
                textTheme: textTheme,
              ),
            ),
          ],
        ),
      );
    });
  }
}
