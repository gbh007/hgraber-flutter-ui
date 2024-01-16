import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hgraber_ui/repository/repository.dart';

import 'home_screen.dart';
import 'bloc/bloc.dart';

final class HomeScreenAssembly extends StatelessWidget {
  const HomeScreenAssembly({super.key});

  @override
  Widget build(BuildContext context) {
    final client = RepositoryProvider.of<Repository>(context);

    return BlocProvider(
      create: (_) => HomeScreenBloc(client)..add(FetchDashboardEvent()),
      child: const HomeScreen(),
    );
  }
}
