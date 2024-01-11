import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hgraber_ui/repository/repository.dart';

sealed class BookListScreenEvent {}

class LoadingBookListEvent extends BookListScreenEvent {
  final int count, page;

  LoadingBookListEvent(this.count, this.page);
}

class RateBookListEvent extends BookListScreenEvent {
  final int count, page, bookID, rate;

  RateBookListEvent(this.count, this.page, this.bookID, this.rate);
}

sealed class BookListScreenState {}

class BookListScreenLoadingState extends BookListScreenState {}

class BookListScreenLoadedState extends BookListScreenState {
  final List<BookShortInfo> model;
  final List<PageForPagination> pages;
  final int count, page;

  BookListScreenLoadedState(
    this.model,
    this.count,
    this.page,
    this.pages,
  );
}

class BookListScreenErrorState extends BookListScreenState {
  final String message;
  final int count, page;

  BookListScreenErrorState(this.message, this.count, this.page);
}

class BookListScreenBloc
    extends Bloc<BookListScreenEvent, BookListScreenState> {
  final Repository _client;

  BookListScreenBloc(this._client) : super(BookListScreenLoadingState()) {
    on<LoadingBookListEvent>((event, emit) async {
      emit(BookListScreenLoadingState());
      try {
        final data = await _client.books(event.count, event.page);
        emit(BookListScreenLoadedState(
          data.books,
          event.count,
          event.page,
          data.pages,
        ));
      } catch (e) {
        emit(BookListScreenErrorState(e.toString(), event.count, event.page));
      }
    });
    on<RateBookListEvent>((event, emit) async {
      try {
        await _client.updateBookRating(event.bookID, event.rate);
        add(LoadingBookListEvent(event.count, event.page));
      } catch (e) {
        emit(BookListScreenErrorState(e.toString(), event.count, event.page));
      }
    });
  }
}
