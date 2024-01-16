import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hgraber_ui/features/book/bloc/model.dart';

import 'package:hgraber_ui/widgets/rate.dart';
import 'image_preview_widget.dart';

class BookPagesPreviewWidget extends StatelessWidget {
  final List<BookPagePreview> pages;
  final void Function(int)? onTap;
  final void Function(int page, int rate)? updateRate;
  final TextTheme textTheme;
  final ColorScheme colorScheme;

  const BookPagesPreviewWidget({
    required this.pages,
    this.onTap,
    this.updateRate,
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
                child: ImagePreviewWidget(
                  url: page.previewUrl,
                  colorScheme: colorScheme,
                  textTheme: textTheme,
                ),
              ),
              Center(
                  child: RateWidget(
                page.rate,
                updateRating: (rate) {
                  if (updateRate != null) {
                    updateRate!(page.pageNumber, rate);
                  }
                },
              )),
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
