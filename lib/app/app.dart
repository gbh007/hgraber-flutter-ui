import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hgraber_ui/features/book/book_screen.dart';
import 'package:hgraber_ui/common/global.dart';
import 'package:hgraber_ui/features/settings/settings_screen.dart';

import 'package:hgraber_ui/repository/repository.dart';

import 'package:hgraber_ui/features/main/main_screen.dart';

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => MainScreen(),
      // routes: <RouteBase>[],
    ),
    GoRoute(
      path: "/book/:id",
      builder: (context, state) {
        int id = int.parse(state.pathParameters['id']!);
        return BookScreen(id);
      },
    ),
    GoRoute(
      path: "/settings",
      builder: (context, state) => SettingsScreen(),
    ),
  ],
);

class HGraberApp extends StatelessWidget {
  const HGraberApp({super.key});

  @override
  Widget build(BuildContext context) {
    return _RepositoryLayout();
  }
}

class _RepositoryLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) {
        HGraberClient client = HGraberHTTPClient(baseUrl: '');
        return client;
      },
      child: _BLocLayout(),
    );
  }
}

class _BLocLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final client = RepositoryProvider.of<HGraberClient>(context);
    return BlocProvider(
      create: (_) => GlobalBloc(client)
        ..add(SetGlobalEvent(
            const GlobalModel(baseUrl: baseUrl, scale: 1.0, bookOnPage: 20))),
      child: BlocBuilder<GlobalBloc, GlobalState>(
        builder: (context, state) {
          if (state is GlobalLoadingState) {
            return const CircularProgressIndicator.adaptive();
          }

          if (state is GlobalLoadedState) {
            return MaterialApp.router(
              // supportedLocales: [Locale('ru', 'RU')],
              debugShowCheckedModeBanner: false,
              title: 'HGraber UI',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
                useMaterial3: true,
              ),
              routerConfig: _router,
              builder: (context, child) {
                return MediaQuery(
                    data: MediaQuery.of(context).copyWith(
                      textScaler: TextScaler.linear(state.model.scale),
                    ),
                    child: child ?? SizedBox.shrink());
              },
            );
          }

          return const CircularProgressIndicator.adaptive();
        },
      ),
    );
  }
}
