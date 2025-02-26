import 'package:flutter/material.dart';
import 'package:hgraber_ui/features/book_list/bloc/model.dart';
import 'package:hgraber_ui/widgets/image_widget.dart';
import 'book_attribute_widget.dart';
import 'book_bar_widget.dart';

class BookShortInfoWidget extends StatelessWidget {
  final Book book;
  final void Function(int)? updateRating;
  final TextTheme textTheme;
  final ColorScheme colorScheme;

  const BookShortInfoWidget({
    required this.book,
    this.updateRating,
    required this.textTheme,
    required this.colorScheme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: ImageWidget(
              url: book.previewUrl,
              colorScheme: colorScheme,
              textTheme: textTheme,
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    book.name,
                    style: textTheme.headlineMedium?.copyWith(
                      color: colorScheme.primary,
                    ),
                  ),
                  BookBarWidget(
                    info: book.info,
                    updateRating: updateRating,
                    colorScheme: colorScheme,
                    textTheme: textTheme,
                  ),
                  BookAttributeWidget(
                    // FIXME: не отрисовывать если пустой
                    name: 'Тэги',
                    attributes: book.tags ?? List.empty(),
                    colorScheme: colorScheme,
                    textTheme: textTheme,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
