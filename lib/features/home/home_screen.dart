import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hgraber_ui/widgets/screen.dart';
import 'widgets/dashboard_widget.dart';
import 'widgets/workers_widget.dart';
import 'bloc/bloc.dart';

final class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenBloc, HomeScreenState>(
      builder: (context, state) {
        if (state is HomeScreenErrorState) {
          return ErrorScaffold(
            title: 'Главная',
            text: state.message,
            onTap: () =>
                context.read<HomeScreenBloc>().add(FetchDashboardEvent()),
          );
        }

        if (state is HomeScreenLoadedState) {
          return SimpleScaffold(
            title: 'Главная',
            floatingActionButton: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                FloatingActionButton(
                  child: const Icon(Icons.refresh),
                  onPressed: () =>
                      context.read<HomeScreenBloc>().add(FetchDashboardEvent()),
                ),
              ],
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DashboardWidget(dashboard: state.dashboard),
                      WorkersWidget(workers: state.workers),
                    ],
                  ),
                ),
              ),
            ),
          );
        }

        return const LoadingScaffold(title: 'Главная');
      },
    );
  }
}
