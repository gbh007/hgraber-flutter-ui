import 'package:flutter/material.dart';

class BookAttributeWidget extends StatelessWidget {
  final String name;
  final List<String> attributes;
  final TextTheme textTheme;
  final ColorScheme colorScheme;

  const BookAttributeWidget({
    required this.name,
    required this.attributes,
    required this.textTheme,
    required this.colorScheme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 3),
      child: Wrap(
        spacing: 5,
        children: <Widget>[
          Text(name, style: textTheme.bodyMedium),
          ...attributes.map(
            (e) => Container(
              decoration: BoxDecoration(
                  color: colorScheme.secondaryContainer,
                  borderRadius: const BorderRadius.all(Radius.circular(5))),
              // margin: EdgeInsets.only(left: 5),
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: Text(e, style: textTheme.bodyMedium),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
