import 'repository.dart';

const String baseUrl = 'http://localhost:8080/';

abstract class HGraberClient {
  Future<MainPageData> mainInfo();
  Future<Book> bookInfo(int id);
}
