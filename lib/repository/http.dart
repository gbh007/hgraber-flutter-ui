import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'repository.dart';

class HGraberHTTPClient extends HGraberClient {
  late final DioForNative _client;

  HGraberHTTPClient({
    required String baseUrl,
  }) {
    _client = DioForNative(BaseOptions(
      baseUrl: baseUrl,
      contentType: Headers.jsonContentType,
    ));
  }

  Future<MainInfoData> mainInfo() {
    return _client.get('/info').then((resp) {
      var body = resp.data as Map<String, dynamic>;
      return MainInfoData.fromJson(body);
    });
  }
}
