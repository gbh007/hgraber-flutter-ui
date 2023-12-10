import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hgraber_ui/repository/http.dart';
import 'view.dart';
import 'bloc.dart';

class MainPage extends StatelessWidget {
  final HGraberClient client;

  const MainPage({
    required this.client,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MainPageState(client: client),
      child: const MainPageView(),
    );
  }
}
