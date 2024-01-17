import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hgraber_ui/common/global.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
    return BlocBuilder<GlobalBloc, GlobalModel>(
      builder: (context, state) {
        if (url != null) {
          return Image(
            image: CachedNetworkImageProvider(
              // FIXME: не работает на вебе
              url!,
              headers: <String, String>{
                'x-token': state.token // FIXME: в константу
              },
            ),
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
      },
    );
  }
}
