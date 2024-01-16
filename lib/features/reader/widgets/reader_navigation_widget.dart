import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc.dart';

class ReaderNavigationWidget extends StatelessWidget {
  final int pageCount;

  const ReaderNavigationWidget({
    required this.pageCount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentPageCubit, int>(builder: (context, state) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: FloatingActionButton(
              heroTag: "back",
              onPressed: () {
                context.read<CurrentPageCubit>().back(pageCount);
              },
              child: const Icon(Icons.arrow_back),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: FloatingActionButton(
              heroTag: "forward",
              onPressed: () {
                context.read<CurrentPageCubit>().forward(pageCount);
              },
              child: const Icon(Icons.arrow_forward),
            ),
          ),
        ],
      );
    });
  }
}
