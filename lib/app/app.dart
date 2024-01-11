import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hgraber_ui/features/book/book_screen.dart';
import 'package:hgraber_ui/common/global.dart';
import 'package:hgraber_ui/features/reader/screen.dart';
import 'package:hgraber_ui/features/settings/settings_screen.dart';

import 'package:hgraber_ui/repository/repository.dart';

import 'package:hgraber_ui/features/main/main_screen.dart';

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const MainScreen(),
      // routes: <RouteBase>[],
    ),
    GoRoute(
        path: "/book",
        builder: (context, state) => const BookListScreen(),
        routes: [
          GoRoute(
            path: ":id",
            builder: (context, state) {
              int id = int.parse(state.pathParameters['id']!);
              return BookScreen(id);
            },
            routes: [
              GoRoute(
                path: "read/:pageNumber",
                builder: (context, state) {
                  int id = int.parse(state.pathParameters['id']!);
                  int? pageNumber;

                  if (state.pathParameters['pageNumber'] != null) {
                    pageNumber = int.parse(state.pathParameters['pageNumber']!);
                  }

                  return ReaderScreen(
                    id,
                    currentPage: pageNumber,
                  );
                },
              ),
            ],
          ),
        ]),
    GoRoute(
      path: "/settings",
      builder: (context, state) => const SettingsScreen(),
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
        return Repository(baseUrl);
      },
      child: _BLocLayout(),
    );
  }
}

class _BLocLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final client = RepositoryProvider.of<Repository>(context);
    return BlocProvider(
      create: (_) => GlobalBloc(client),
      lazy: false,
      child: BlocBuilder<GlobalBloc, GlobalModel>(
        builder: (context, state) {
          return MaterialApp.router(
            // supportedLocales: [Locale('ru', 'RU')],
            debugShowCheckedModeBanner: false,
            title: 'HGraber UI',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
              iconTheme:
                  IconThemeData.fallback().copyWith(size: 24 * state.scale),
              useMaterial3: true,
            ),
            routerConfig: _router,
            builder: (context, child) {
              return MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                    textScaler: TextScaler.linear(state.scale),
                  ),
                  child: child ?? SizedBox.shrink());
            },
          );
        },
      ),
    );
  }
}
