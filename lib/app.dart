import 'package:flutter/material.dart';
import 'package:hgraber_ui/repository/http.dart';
import 'main_page/main_page.dart';

class HGraberApp extends StatelessWidget {
  final HGraberClient client;

  const HGraberApp({required this.client, super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // supportedLocales: [Locale('ru', 'RU')],
      debugShowCheckedModeBanner: false,
      title: 'HGraber UI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: MainPage(client: client),
    );
  }
}
