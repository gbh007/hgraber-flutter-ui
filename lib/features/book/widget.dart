import 'package:flutter/material.dart';

import 'package:hgraber_ui/repository/repository.dart';

class BookWidget extends StatelessWidget {
  final Book model;

  const BookWidget(
    this.model, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final firstUrl = model.urlsToView().firstOrNull;

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            // FIXME: поправить рендеринг на странице книги.
            flex: 1,
            child: BookImagePreviewWidget(firstUrl),
          ),
          Expanded(
            flex: 3,
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    model.info.name ?? '',
                    style: textTheme.headlineMedium?.copyWith(
                      color: colorScheme.primary,
                    ),
                  ),
                  ...model.info.attributes().map((e) => BookAttributesWidget(
                        name: e.$1,
                        attributes: e.$2,
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BookImagePreviewWidget extends StatelessWidget {
  final String? url;

  const BookImagePreviewWidget(
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

class BookAttributesWidget extends StatelessWidget {
  final String name;
  final List<String> attributes;

  const BookAttributesWidget({
    required this.name,
    required this.attributes,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: EdgeInsets.only(top: 3),
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
