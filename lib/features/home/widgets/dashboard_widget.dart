import 'package:flutter/material.dart';
import 'package:hgraber_ui/features/home/bloc/model.dart';

class DashboardWidget extends StatelessWidget {
  final Dashboard dashboard;

  const DashboardWidget({
    required this.dashboard,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Всего ${dashboard.count} книг'),
        Text('Всего не загружено ${dashboard.notLoadCount} книг'),
        Text('Всего ${dashboard.pageCount} страниц'),
        Text('Всего не загружено ${dashboard.notLoadPageCount} страниц'),
      ],
    );
  }
}
