import 'package:flutter/material.dart';
import 'repository/http.dart';
import 'app.dart';

void main() {
  var client = HGraberClient(baseUrl: 'http://localhost:8080/');

  runApp(HGraberApp(
    client: client,
  ));
}
