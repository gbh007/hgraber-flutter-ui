import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String? url;
  final TextTheme textTheme;
  final ColorScheme colorScheme;

  const ImageWidget({
    required this.url,
    required this.textTheme,
    required this.colorScheme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
