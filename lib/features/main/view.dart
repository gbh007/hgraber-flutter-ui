import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hgraber_ui/widgets/navigation.dart';

import 'wigets.dart';
import 'bloc.dart';

class MainPageView extends StatelessWidget {
  const MainPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return SimpleScreen(
      titleText: 'Главная',
      body: Center(
        child: BlocBuilder<MainPageBloc, MainPageState>(
          builder: (context, state) {
            if (state is MainPageErrorState) {
              return Center(
                child: Text(state.message,
                    style: textTheme.bodyMedium
                        ?.copyWith(color: colorScheme.error)),
              );
            }

            if (state is MainPageLoadedState) {
              final model = state.model;

              List<Widget> widgets = [MainInfoWidget(model)];

              if (model.monitor != null && model.monitor!.workers != null) {
                widgets.add(WorkersWidget(model.monitor!.workers!));
              }

              return Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widgets,
                  ),
                ),
              );
            }

            return const CircularProgressIndicator.adaptive();
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: const Icon(Icons.refresh),
            onPressed: () => context.read<MainPageBloc>().add(FetchMainEvent()),
          ),
        ],
      ),
    );
  }
}
