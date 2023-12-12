import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import 'repository.dart';

class HGraberHTTPClient implements HGraberClient {
  late Dio _client;

  HGraberHTTPClient({
    required String baseUrl,
  }) {
    if (kIsWeb) {
      _client = Dio(BaseOptions(
        baseUrl: baseUrl,
        contentType: Headers.jsonContentType,
      ));
    } else {
      _client = DioForNative(BaseOptions(
        baseUrl: baseUrl,
        contentType: Headers.jsonContentType,
      ));
    }
  }

  void updateBaseUrl(String baseUrl) {
    if (kIsWeb) {
      _client = Dio(BaseOptions(
        baseUrl: baseUrl,
        contentType: Headers.jsonContentType,
      ));
    } else {
      _client = DioForNative(BaseOptions(
        baseUrl: baseUrl,
        contentType: Headers.jsonContentType,
      ));
    }
  }

  Future<MainPageData> mainInfo() {
    return _client.get('/info').then((resp) {
      var body = resp.data as Map<String, dynamic>;
      return MainPageData.fromJson(body);
    });
  }

  Future<Book> bookInfo(int id) {
    return _client.post('/title/details', data: {'id': id}).then((resp) {
      var body = resp.data as Map<String, dynamic>;
      return Book.fromJson(body);
    });
  }
}
