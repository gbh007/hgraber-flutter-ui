import 'package:flutter/material.dart';
import 'package:hgraber_ui/features/book/bloc/model.dart';
import 'book_attribute_widget.dart';

class BookAttributesWidget extends StatelessWidget {
  final List<BookAttribute> attributes;
  final TextTheme textTheme;
  final ColorScheme colorScheme;

  const BookAttributesWidget({
    required this.attributes,
    required this.textTheme,
    required this.colorScheme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: attributes
          .map((attr) => BookAttributeWidget(
                name: attr.name,
                attributes: attr.values,
                colorScheme: colorScheme,
                textTheme: textTheme,
              ))
          .toList(),
    );
  }
}
