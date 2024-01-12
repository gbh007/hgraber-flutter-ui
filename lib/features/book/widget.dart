import 'dart:math';

import 'package:flutter/material.dart';

import 'package:hgraber_ui/repository/repository.dart';
import 'package:hgraber_ui/widgets/rate.dart';

class BookDetailsWidget extends StatelessWidget {
  final BookDetailInfo model;
  final void Function(int)? updateRate;

  const BookDetailsWidget(
    this.model, {
    this.updateRate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: BookImagePreviewWidget(model.previewUrl),
          ),
          Expanded(
            flex: 3,
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    model.name,
                    style: textTheme.headlineMedium?.copyWith(
                      color: colorScheme.primary,
                    ),
                  ),
                  BookBarWidget(
                    id: model.id,
                    created: model.created,
                    parsedName: model.parsedName,
                    name: model.name,
                    parsedPage: model.parsedPage,
                    pageCount: model.pageCount,
                    pageLoadedPercent: model.pageLoadedPercent,
                    rating: model.rate,
                    updateRating: updateRate,
                  ),
                  BookAttributesWidget(
                      // FIXME: не отрисовывать если пустой
                      attributes: model.attributes ?? List.empty())
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BookShortInfoWidget extends StatelessWidget {
  final BookShortInfo model;
  final void Function(int)? updateRate;

  const BookShortInfoWidget(
    this.model, {
    this.updateRate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: BookImagePreviewWidget(model.previewUrl),
          ),
          Expanded(
            flex: 3,
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    model.name,
                    style: textTheme.headlineMedium?.copyWith(
                      color: colorScheme.primary,
                    ),
                  ),
                  BookBarWidget(
                    id: model.id,
                    created: model.created,
                    parsedName: model.parsedName,
                    name: model.name,
                    parsedPage: model.parsedPage,
                    pageCount: model.pageCount,
                    pageLoadedPercent: model.pageLoadedPercent,
                    rating: model.rate,
                    updateRating: updateRate,
                  ),
                  BookAttributeWidget(
                      name: 'Тэги',
                      attributes: model.tags ??
                          List.empty()) // FIXME: не отрисовывать если пустой
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
  final List<BookDetailAttributeInfo> attributes;

  const BookAttributesWidget({
    required this.attributes,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: attributes
          .map((attr) =>
              BookAttributeWidget(name: attr.name, attributes: attr.values))
          .toList(),
    );
  }
}

class BookAttributeWidget extends StatelessWidget {
  final String name;
  final List<String> attributes;

  const BookAttributeWidget({
    required this.name,
    required this.attributes,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

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

class BookBarWidget extends StatelessWidget {
  final int id;
  final DateTime created;
  final bool parsedName;
  final String name;
  final bool parsedPage;
  final int pageCount;
  final double pageLoadedPercent;
  final int rating;
  final void Function(int)? updateRating;

  const BookBarWidget({
    this.updateRating,
    super.key,
    required this.id,
    required this.created,
    required this.parsedName,
    required this.name,
    required this.parsedPage,
    required this.pageCount,
    required this.pageLoadedPercent,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    var createdInLocal = created.toLocal();
    String convertedDateTime =
        "${createdInLocal.day.toString().padLeft(2, '0')}.${createdInLocal.month.toString().padLeft(2, '0')}.${createdInLocal.year.toString()}, ${createdInLocal.hour.toString().padLeft(2, '0')}:${createdInLocal.minute.toString().padLeft(2, '0')}:${createdInLocal.second.toString().padLeft(2, '0')}";

    return Wrap(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('#$id'),
            RateWidget(rating, updateRating: updateRating),
            Text('Страниц: $pageCount'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Загружено: $pageLoadedPercent',
              style: pageLoadedPercent == 100.0
                  ? null
                  : textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onError,
                      backgroundColor: colorScheme.onErrorContainer,
                    ),
            ),
            Text(convertedDateTime),
          ],
        ),
      ],
    );
  }
}

class BookImageListWidget extends StatelessWidget {
  final List<BookDetailPagePreview> model;
  final void Function(int)? onTap;
  final void Function(int page, int rate)? updateRate;

  const BookImageListWidget(
    this.model, {
    this.onTap,
    this.updateRate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final int bookOnRow =
        max(1, (MediaQuery.of(context).size.width / 300).floor());

    final images = List<Widget>.empty(growable: true);

    model.forEach((page) {
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
                child: BookImagePreviewWidget(page.previewUrl),
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
