import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  final int rate;
  final void Function(int rate)? updateRating;

  const RatingWidget(
    this.rate, {
    this.updateRating,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var widgets = List<Widget>.empty(growable: true);

    for (var i = 1; i <= 5; i++) {
      var ratePos = i;
      widgets.add(
        IconButton(
          onPressed: () => updateRating == null ? () : updateRating!(ratePos),
          icon: Icon(
            rate >= ratePos ? Icons.star : Icons.star_border,
          ),
        ),
      );
    }

    return Row(
      children: widgets,
    );
  }
}
