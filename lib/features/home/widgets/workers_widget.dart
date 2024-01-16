import 'package:flutter/material.dart';
import 'package:hgraber_ui/features/home/bloc/model.dart';

class WorkersWidget extends StatelessWidget {
  final List<Worker> workers;

  const WorkersWidget({
    required this.workers,
    super.key,
  });

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
        ...workers.map<TableRow>((workerData) => TableRow(
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
