import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hgraber_ui/features/book/book_screen_assembly.dart';
import 'package:hgraber_ui/common/global.dart';
import 'package:hgraber_ui/features/book_list/book_list_screen_assembly.dart';
import 'package:hgraber_ui/features/reader/reader_screen_assembly.dart';
import 'package:hgraber_ui/features/settings/settings_screen.dart';
import 'package:hgraber_ui/repository/repository.dart';
import 'package:hgraber_ui/features/home/home_screen_assembly.dart';

final class AppAssembly extends StatelessWidget {
  const AppAssembly({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = Repository(baseUrl, '');
    return MultiBlocProvider(
      providers: [
        RepositoryProvider(create: (_) => repository),
        BlocProvider(
          create: (_) => GlobalBloc(repository),
          lazy: false,
        )
      ],
      child: _App(),
    );
  }
}

final class _App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalBloc, GlobalModel>(
      builder: (context, state) {
        return MaterialApp.router(
          // supportedLocales: [Locale('ru', 'RU')],
          debugShowCheckedModeBanner: false,
          title: 'HGraber UI',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
            iconTheme:
                const IconThemeData.fallback().copyWith(size: 24 * state.scale),
            useMaterial3: true,
          ),
          routerConfig: GoRouter(
            routes: makeRouteConfig(),
          ),
          builder: (context, child) {
            return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaler: TextScaler.linear(state.scale),
                ),
                child: child ?? const SizedBox.shrink());
          },
        );
      },
    );
  }

  List<RouteBase> makeRouteConfig() {
    return <RouteBase>[
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const HomeScreenAssembly(),
      ),
      GoRoute(
          path: "/book",
          builder: (context, state) => const BookListScreenAssembly(),
          routes: [
            GoRoute(
              path: ":id",
              builder: (context, state) {
                int id = int.parse(state.pathParameters['id']!);
                return BookScreenAssembly(id: id);
              },
              routes: [
                GoRoute(
                  path: "read/:pageNumber",
                  builder: (context, state) {
                    int id = int.parse(state.pathParameters['id']!);
                    int? pageNumber;

                    if (state.pathParameters['pageNumber'] != null) {
                      pageNumber =
                          int.parse(state.pathParameters['pageNumber']!);
                    }

                    return ReaderScreenAssembly(
                      id: id,
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
    ];
  }
}
