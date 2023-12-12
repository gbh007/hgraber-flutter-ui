import 'package:flutter/material.dart';

import 'package:hgraber_ui/common/global.dart';

class SettingsWidget extends StatelessWidget {
  final GlobalModel model;
  final Function(GlobalModel) onChange;
  final Function(GlobalModel) onApply;

  const SettingsWidget({
    required this.model,
    required this.onChange,
    required this.onApply,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: (12 / (model.scale > 0.1 ? model.scale : 0.1)),
      padding: const EdgeInsets.all(20),
      children: <Widget>[
        const Text('Адрес сервера'),
        TextField(
          controller: TextEditingController(text: model.baseUrl),
          onSubmitted: (value) => onApply(model.copyWith(baseUrl: value)),
        ),
        const Text('Масштабирование'),
        TextField(
          controller: TextEditingController(text: '${model.scale}'),
          onSubmitted: (value) {
            try {
              onApply(model.copyWith(scale: double.parse(value)));
            } catch (_) {} // FIXME: обрабатывать
          },
        ),
        const Text('Количество книг на странице'),
        TextField(
          controller: TextEditingController(text: '${model.bookOnPage}'),
          onSubmitted: (value) {
            try {
              onApply(model.copyWith(bookOnPage: int.parse(value)));
            } catch (_) {} // FIXME: обрабатывать
          },
        ),
      ],
    );
  }
}
