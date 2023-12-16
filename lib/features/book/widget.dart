import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:hgraber_ui/repository/repository.dart';
import 'package:hgraber_ui/widgets/rate.dart';

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
                  BookBarWidget(model),
                  ...model.info.attributes().map((e) => BookAttributesWidget(
                        name: e.$1,
                        attributes: e.$2,
                      )),
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

class BookBarWidget extends StatelessWidget {
  final Book model;

  const BookBarWidget(
    this.model, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final loadedPagePercent = model.loadedPagePercent();
    var created = model.created.toLocal();
    String convertedDateTime =
        "${created.day.toString().padLeft(2, '0')}.${created.month.toString().padLeft(2, '0')}.${created.year.toString()}, ${created.hour.toString().padLeft(2, '0')}:${created.minute.toString().padLeft(2, '0')}:${created.second.toString().padLeft(2, '0')}";

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text('#${model.id}'),
        RateWidget(model.info.rate ?? 0),
        Text('Страниц: ${model.pages.length}'),
        Text(
          'Загружено: $loadedPagePercent',
          style: loadedPagePercent == 100.0
              ? null
              : textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onError,
                  backgroundColor: colorScheme.onErrorContainer,
                ),
        ),
        Text(convertedDateTime),
      ],
    );
  }
}

class BookImageListWidget extends StatelessWidget {
  final Book model;
  final void Function(int)? onTap;

  const BookImageListWidget(this.model, {this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    final int bookOnRow =
        max(1, (MediaQuery.of(context).size.width / 300).floor());

    final images = List<Widget>.empty(growable: true);

    model.pages.asMap().forEach((pageNumber, page) {
      images.add(
        InkWell(
          onTap: () {
            if (onTap != null) {
              onTap!(pageNumber + 1);
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: BookImagePreviewWidget(
                  page.success
                      ? page.getServerUrl(model.id, pageNumber + 1)
                      : null,
                ),
              ),
              Center(child: RateWidget(page.rate ?? 0)),
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
