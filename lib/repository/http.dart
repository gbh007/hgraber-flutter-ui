import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'repository.dart';


class HGraberHTTPClient implements HGraberClient {
  late final DioForNative _client;

  HGraberHTTPClient({
    required String baseUrl,
  }) {
    _client = DioForNative(BaseOptions(
      baseUrl: baseUrl,
      contentType: Headers.jsonContentType,
    ));
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
