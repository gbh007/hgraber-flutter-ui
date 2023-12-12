import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hgraber_ui/features/book/book_screen.dart';
import 'package:hgraber_ui/common/global.dart';

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
  ],
);

class HGraberApp extends StatelessWidget {
  const HGraberApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GlobalBloc()
        ..add(LoadedGlobalEvent(
            const GlobalModel(baseUrl: baseUrl, scale: 1.0, bookOnPage: 20))),
      child: BlocBuilder<GlobalBloc, GlobalState>(
        builder: (context, state) {
          if (state is GlobalLoadingState) {
            return CircularProgressIndicator.adaptive();
          }

          if (state is GlobalLoadedState) {
            return RepositoryProvider(
              create: (context) {
                HGraberClient client =
                    HGraberHTTPClient(baseUrl: state.model.baseUrl);
                return client;
              },
              child: MaterialApp.router(
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
                          textScaler: TextScaler.linear(state.model.scale)),
                      child: child ?? SizedBox.shrink());
                },
              ),
            );
          }

          return CircularProgressIndicator.adaptive();
        },
      ),
    );
  }
}
