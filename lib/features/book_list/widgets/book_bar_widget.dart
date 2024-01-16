import 'package:flutter/material.dart';
import 'package:hgraber_ui/features/book_list/bloc/model.dart';
import 'package:hgraber_ui/widgets/rate.dart';

class BookBarWidget extends StatelessWidget {
  final BookInfo info;
  final void Function(int)? updateRating;
  final TextTheme textTheme;
  final ColorScheme colorScheme;

  const BookBarWidget({
    required this.info,
    required this.textTheme,
    required this.colorScheme,
    this.updateRating,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var createdInLocal = info.created.toLocal();
    String convertedDateTime =
        "${createdInLocal.day.toString().padLeft(2, '0')}.${createdInLocal.month.toString().padLeft(2, '0')}.${createdInLocal.year.toString()}, ${createdInLocal.hour.toString().padLeft(2, '0')}:${createdInLocal.minute.toString().padLeft(2, '0')}:${createdInLocal.second.toString().padLeft(2, '0')}";

    return Wrap(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('#${info.id}'),
            RateWidget(info.rating, updateRating: updateRating),
            Text('Страниц: ${info.pageCount}'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Загружено: ${info.pageLoadedPercent}',
              style: info.pageLoadedPercent == 100.0
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
