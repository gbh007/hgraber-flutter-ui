import 'package:flutter/material.dart';
import 'package:hgraber_ui/repository/repository.dart';

class WorkersWidget extends StatelessWidget {
  final List<Worker> model;

  const WorkersWidget(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        const TableRow(
          children: <Widget>[
            Text('Название'),
            Text('В очереди'),
            Text('В работе'),
            Text('Раннеров'),
          ],
        ),
        ...model.map<TableRow>((workerData) => TableRow(
              children: <Widget>[
                Text(workerData.name),
                Text('${workerData.inQueue}'),
                Text('${workerData.inWork}'),
                Text('${workerData.runners}'),
              ],
            ))
      ],
    );
  }
}

class MainInfoWidget extends StatelessWidget {
  final MainPageData model;

  const MainInfoWidget(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Всего ${model.count} тайтлов'),
          Text('Всего незагруженно ${model.notLoadCount} тайтлов'),
          Text('Всего ${model.pageCount} страниц'),
          Text('Всего незагруженно ${model.notLoadPageCount} страниц'),
        ],
      ),
    );
  }
}
