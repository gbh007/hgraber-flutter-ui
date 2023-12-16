import 'package:flutter/material.dart';

abstract final class _RateColor {
  static Color fromRate(int rate) {
    if (rate < 1) {
      return const Color.fromARGB(0, 0, 0, 0);
    }

    if (rate < 2) {
      return const Color.fromARGB(255, 255, 0, 0);
    }

    if (rate < 3) {
      return const Color.fromARGB(255, 255, 165, 0);
    }

    if (rate < 4) {
      return const Color.fromARGB(255, 255, 255, 0);
    }

    if (rate < 5) {
      return const Color.fromARGB(255, 144, 238, 144);
    }

    return const Color.fromARGB(255, 0, 128, 0);
  }
}

class RateWidget extends StatelessWidget {
  final int rate;
  final Function(int)? updateRate;

  const RateWidget(
    this.rate, {
    this.updateRate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final textTheme = Theme.of(context).textTheme;
    // final colorScheme = Theme.of(context).colorScheme;

    var widgets = List<Widget>.empty(growable: true);

    for (var i = 1; i <= 5; i++) {
      var ratePos = i;
      widgets.add(
        IconButton(
          onPressed: () => updateRate == null ? () : updateRate!(ratePos),
          icon: Icon(
            rate >= ratePos ? Icons.star : Icons.star_border,
            // На данный момент цвет выглядит не очень
            // color: _RateColor.fromRate(rate),
          ),
        ),
      );
    }

    return Row(
      children: widgets,
    );
  }
}
