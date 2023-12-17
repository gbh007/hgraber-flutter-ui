import 'repository.dart';

const String baseUrl = 'http://localhost:8080/';

abstract class HGraberClient {
  Future<MainPageData> mainInfo();
  Future<Book> bookInfo(int id);
  Future<List<Book>> bookList(int count, int offset);
  Future<void> bookRate(int id, int rate);
  Future<void> pageRate(int id, int pageNumber, int rate);

  // FIXME: жесткий костыль
  void updateBaseUrl(String baseUrl);
}
