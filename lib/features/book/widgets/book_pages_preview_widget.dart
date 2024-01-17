import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hgraber_ui/features/book/bloc/model.dart';
import 'package:hgraber_ui/widgets/image_widget.dart';

import 'package:hgraber_ui/widgets/rating.dart';

class BookPagesPreviewWidget extends StatelessWidget {
  final List<BookPagePreview> pages;
  final void Function(int)? onTap;
  final void Function(int page, int rating)? updateRating;
  final TextTheme textTheme;
  final ColorScheme colorScheme;

  const BookPagesPreviewWidget({
    required this.pages,
    this.onTap,
    this.updateRating,
    required this.textTheme,
    required this.colorScheme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // FIXME: а куда это?
    final int bookOnRow =
        max(1, (MediaQuery.of(context).size.width / 300).floor());

    final images = List<Widget>.empty(growable: true);

    pages.forEach((page) {
      images.add(
        InkWell(
          onTap: () {
            if (onTap != null) {
              onTap!(page.pageNumber);
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: ImageWidget(
                  url: page.previewUrl,
                  colorScheme: colorScheme,
                  textTheme: textTheme,
                ),
              ),
              Center(
                child: RatingWidget(
                  page.rating,
                  updateRating: (rating) {
                    if (updateRating != null) {
                      updateRating!(page.pageNumber, rating);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });

    return GridView.count(
      crossAxisCount: bookOnRow,
      padding: const EdgeInsets.all(10),
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      children: images,
    );
  }
}
