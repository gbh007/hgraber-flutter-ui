import 'repository_model.dart';
import 'client_v2/api_v2_client.dart';

class Repository {
  late APIv2Client _v2client;

  Repository(String baseUrl, String token) {
    _v2client = APIv2Client(baseUrl: baseUrl, token: token);
  }

  void updateBaseUrl(String baseUrl, String token) {
    // FIXME: сделать без токена
    _v2client = APIv2Client(baseUrl: baseUrl, token: token);
  }

  Future<Dashboard> info() {
    return _v2client.info().then((info) => Dashboard(
          count: info.count,
          notLoadCount: info.notLoadCount,
          notLoadPageCount: info.notLoadPageCount,
          pageCount: info.pageCount,
          workers: info.monitor?.workers
              ?.map((worker) => Worker(
                  name: worker.name,
                  inQueue: worker.inQueue,
                  inWork: worker.inWork,
                  runners: worker.runners))
              .toList(),
        ));
  }

  Future<BookDetailInfo> book(int id) {
    return _v2client.book(id).then((book) => BookDetailInfo(
          id: book.id,
          created: book.created,
          previewUrl: book.previewUrl,
          parsedName: book.parsedName,
          name: book.name,
          parsedPage: book.parsedPage,
          pageCount: book.pageCount,
          pageLoadedPercent: book.pageLoadedPercent,
          rating: book.rating,
          attributes: book.attributes
              ?.map((attr) =>
                  BookDetailAttributeInfo(name: attr.name, values: attr.values))
              .toList(),
          pages: book.pages
              ?.map((page) => BookDetailPagePreview(
                  pageNumber: page.pageNumber,
                  rating: page.rating,
                  previewUrl: page.previewUrl))
              .toList(),
        ));
  }

  Future<BookListResponse> books(int count, int page) {
    return _v2client.books(count, page).then((value) => BookListResponse(
          books: value.books
              .map((book) => BookShortInfo(
                    id: book.id,
                    created: book.created,
                    previewUrl: book.previewUrl,
                    parsedName: book.parsedName,
                    name: book.name,
                    parsedPage: book.parsedPage,
                    pageCount: book.pageCount,
                    pageLoadedPercent: book.pageLoadedPercent,
                    rating: book.rating,
                    tags: book.tags,
                    hasMoreTags: book.hasMoreTags,
                  ))
              .toList(),
          pages: value.pages
              .map((page) => PageForPagination(
                    value: page.value,
                    isCurrent: page.isCurrent,
                    isSeparator: page.isSeparator,
                  ))
              .toList(),
        ));
  }

  Future<void> updateBookRating(int id, int rating) {
    return _v2client.updateBookRating(id, rating);
  }

  Future<void> updatePageRating(int id, int pageNumber, int rating) {
    return _v2client.updatePageRating(id, pageNumber, rating);
  }
}
