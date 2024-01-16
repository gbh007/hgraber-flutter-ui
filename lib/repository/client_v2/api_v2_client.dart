import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import 'api_v2_model.dart';

class APIv2Client {
  late Dio _client;

  APIv2Client({
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

  Future<APIv2Dashboard> info() {
    return _client.get('/api/info').then((resp) {
      var body = resp.data as Map<String, dynamic>;
      return APIv2Dashboard.fromJson(body);
    });
  }

  Future<APIv2BookDetailInfo> book(int id) {
    return _client.post('/api/book', data: {'id': id}).then((resp) {
      var body = resp.data as Map<String, dynamic>;
      return APIv2BookDetailInfo.fromJson(body);
    });
  }

  Future<APIv2BookListResponse> books(int count, int page) {
    return _client
        .post('/api/books', data: {'count': count, 'page': page}).then((resp) {
      var body = resp.data as Map<String, dynamic>;
      return APIv2BookListResponse.fromJson(body);
    });
  }

  Future<void> updateBookRating(int id, int rate) {
    return _client
        .post('/api/rate', data: {'id': id, 'rate': rate}).then((resp) {
      return;
    });
  }

  Future<void> updatePageRating(int id, int pageNumber, int rate) {
    return _client.post(
      '/api/rate',
      data: {'id': id, 'page': pageNumber, 'rate': rate},
    ).then((resp) {
      return;
    });
  }
}
