import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'main_state.dart';

class HGraberClient {
  late final DioForNative _client;

  HGraberClient({
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
