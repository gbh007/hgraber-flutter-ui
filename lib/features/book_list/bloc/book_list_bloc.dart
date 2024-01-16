import 'package:flutter_bloc/flutter_bloc.dart';
import 'events.dart';
import 'states.dart';
import 'model.dart';
import 'package:hgraber_ui/repository/repository.dart' show Repository;

class BookListScreenBloc
    extends Bloc<BookListScreenEvent, BookListScreenState> {
  final Repository _client;

  BookListScreenBloc(this._client) : super(BookListScreenLoadingState()) {
    on<LoadingBooksEvent>((event, emit) async {
      emit(BookListScreenLoadingState());
      try {
        final data = await _client.books(event.count, event.page);
        emit(BookListScreenLoadedState(
          data.books
              .map((book) => Book(
                    name: book.name,
                    info: BookInfo(
                      id: book.id,
                      created: book.created,
                      parsedName: book.parsedName,
                      name: book.name,
                      parsedPage: book.parsedPage,
                      pageCount: book.pageCount,
                      pageLoadedPercent: book.pageLoadedPercent,
                      rating: book.rate,
                    ),
                    previewUrl: book.previewUrl,
                    tags: book.tags,
                  ))
              .toList(),
          event.count,
          event.page,
          data.pages
              .map((page) => BooksPage(
                    value: page.value,
                    isCurrent: page.isCurrent,
                    isSeparator: page.isSeparator,
                  ))
              .toList(),
        ));
      } catch (e) {
        emit(BookListScreenErrorState(e.toString(), event.count, event.page));
      }
    });
    on<RateBookEvent>((event, emit) async {
      try {
        await _client.updateBookRating(event.bookID, event.rate);
        add(LoadingBooksEvent(event.count, event.page));
      } catch (e) {
        emit(BookListScreenErrorState(e.toString(), event.count, event.page));
      }
    });
  }
}
