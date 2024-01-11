import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hgraber_ui/repository/repository.dart';

import 'view.dart';
import 'bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final client = RepositoryProvider.of<Repository>(context);

    return BlocProvider(
      create: (_) => MainPageBloc(client)..add(FetchMainEvent()),
      child: const MainPageView(),
    );
  }
}
