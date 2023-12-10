import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hgraber_ui/repository/http.dart';
import 'package:hgraber_ui/repository/repository.dart';
import '../features/main_page/main_page.dart';

class HGraberApp extends StatelessWidget {
  const HGraberApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) =>
          HGraberHTTPClient(baseUrl: 'http://localhost:8080/') as HGraberClient,
      child: MaterialApp(
        // supportedLocales: [Locale('ru', 'RU')],
        debugShowCheckedModeBanner: false,
        title: 'HGraber UI',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
          useMaterial3: true,
        ),
        home: MainPage(),
      ),
    );
  }
}
