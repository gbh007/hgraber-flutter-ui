import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hgraber_ui/features/book/book_screen.dart';

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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => HGraberHTTPClient(baseUrl: baseUrl) as HGraberClient,
      child: MaterialApp.router(
        // supportedLocales: [Locale('ru', 'RU')],
        debugShowCheckedModeBanner: false,
        title: 'HGraber UI',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
          useMaterial3: true,
        ),
        routerConfig: _router,
      ),
    );
  }
}
