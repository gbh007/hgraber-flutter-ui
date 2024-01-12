import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hgraber_ui/widgets/screen.dart';

import 'wigets.dart';
import 'bloc.dart';

class MainPageView extends StatelessWidget {
  const MainPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainPageBloc, MainPageState>(
      builder: (context, state) {
        if (state is MainPageErrorState) {
          return ErrorScaffold(
            title: 'Главная',
            text: state.message,
            onTap: () => context.read<MainPageBloc>().add(FetchMainEvent()),
          );
        }

        if (state is MainPageLoadedState) {
          final model = state.model;

          List<Widget> widgets = [MainInfoWidget(model)];

          if (model.workers != null && model.workers!.isNotEmpty) {
            widgets.add(WorkersWidget(model.workers!));
          }

          return SimpleScaffold(
            title: 'Главная',
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widgets,
                  ),
                ),
              ),
            ),
            floatingActionButton: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                FloatingActionButton(
                  child: const Icon(Icons.refresh),
                  onPressed: () =>
                      context.read<MainPageBloc>().add(FetchMainEvent()),
                ),
              ],
            ),
          );
        }

        return const LoadingScaffold(title: 'Главная');
      },
    );
  }
}
