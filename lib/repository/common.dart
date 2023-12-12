import 'repository.dart';

const String baseUrl = 'http://localhost:8080/';

abstract class HGraberClient {
  Future<MainPageData> mainInfo();
  Future<Book> bookInfo(int id);
  // FIXME: жесткий костыль
  void updateBaseUrl(String baseUrl);
}
