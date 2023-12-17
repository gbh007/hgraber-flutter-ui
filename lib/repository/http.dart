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

  @override
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

  @override
  Future<MainPageData> mainInfo() {
    return _client.get('/info').then((resp) {
      var body = resp.data as Map<String, dynamic>;
      return MainPageData.fromJson(body);
    });
  }

  @override
  Future<Book> bookInfo(int id) {
    return _client.post('/title/details', data: {'id': id}).then((resp) {
      var body = resp.data as Map<String, dynamic>;
      return Book.fromJson(body);
    });
  }

  @override
  Future<List<Book>> bookList(int count, int offset) {
    return _client.post('/title/list',
        data: {'count': count, 'offset': offset}).then((resp) {
      return (resp.data as List).map((i) => Book.fromJson(i)).toList();
    });
  }

  @override
  Future<void> bookRate(int id, int rate) {
    return _client
        .post('/title/rate', data: {'id': id, 'rate': rate}).then((resp) {
      return;
    });
  }

  @override
  Future<void> pageRate(int id, int pageNumber, int rate) {
    return _client.post(
      '/title/page/rate',
      data: {'id': id, 'page': pageNumber, 'rate': rate},
    ).then((resp) {
      return;
    });
  }
}
