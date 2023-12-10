import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hgraber_ui/repository/main_state.dart';
import 'bloc.dart';

class MainPageView extends StatelessWidget {
  const MainPageView({super.key});

  @override
  Widget build(BuildContext context) {
    // final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Center(
        child: BlocBuilder<MainPageState, MainInfoData>(
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Всего ${state.count} тайтлов'),
                    Text('Всего незагруженно ${state.notLoadCount} тайтлов'),
                    Text('Всего ${state.pageCount} страниц'),
                    Text(
                        'Всего незагруженно ${state.notLoadPageCount} страниц'),
                    Table(
                      children: [
                        const TableRow(
                          children: <Widget>[
                            Text('Название'),
                            Text('В очереди'),
                            Text('В работе'),
                            Text('Раннеров'),
                          ],
                        ),
                        ...state.monitor!.workers!
                            .map<TableRow>((workerData) => TableRow(
                                  children: <Widget>[
                                    Text(workerData.name),
                                    Text('${workerData.inQueue}'),
                                    Text('${workerData.inWork}'),
                                    Text('${workerData.runners}'),
                                  ],
                                ))
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: const Icon(Icons.refresh),
            onPressed: () => context.read<MainPageState>().fetch(),
          ),
        ],
      ),
    );
  }
}
