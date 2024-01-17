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
    return ListView(
      padding: const EdgeInsets.all(20),
      children: <Widget>[
        Row(
          children: [
            const Expanded(child: Text('Адрес сервера')),
            Expanded(
              child: TextField(
                controller: TextEditingController(text: model.baseUrl),
                onSubmitted: (value) => onApply(model.copyWith(baseUrl: value)),
              ),
            ),
          ],
        ),
        Row(
          children: [
            const Expanded(child: Text('Токен сервера')),
            Expanded(
              child: TextField(
                controller: TextEditingController(text: model.token),
                onSubmitted: (value) => onApply(model.copyWith(token: value)),
              ),
            ),
          ],
        ),
        Row(
          children: [
            const Expanded(child: Text('Масштабирование')),
            Expanded(
              child: TextField(
                controller: TextEditingController(text: '${model.scale}'),
                onSubmitted: (value) {
                  try {
                    onApply(model.copyWith(scale: double.parse(value)));
                  } catch (_) {} // FIXME: обрабатывать
                },
              ),
            ),
          ],
        ),
        Row(
          children: [
            const Expanded(child: Text('Количество книг на странице')),
            Expanded(
              child: TextField(
                controller: TextEditingController(text: '${model.bookOnPage}'),
                onSubmitted: (value) {
                  try {
                    onApply(model.copyWith(bookOnPage: int.parse(value)));
                  } catch (_) {} // FIXME: обрабатывать
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
