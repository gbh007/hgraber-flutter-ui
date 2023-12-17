import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hgraber_ui/repository/repository.dart';

sealed class BookListScreenEvent {}

class LoadingBookListEvent extends BookListScreenEvent {
  final int count, offset;

  LoadingBookListEvent(this.count, this.offset);
}

class RateBookListEvent extends BookListScreenEvent {
  final int count, offset, bookID, rate;

  RateBookListEvent(this.count, this.offset, this.bookID, this.rate);
}

sealed class BookListScreenState {}

class BookListScreenLoadingState extends BookListScreenState {}

class BookListScreenLoadedState extends BookListScreenState {
  final List<Book> model;
  final int count, offset;

  BookListScreenLoadedState(this.model, this.count, this.offset);
}

class BookListScreenErrorState extends BookListScreenState {
  final String message;
  final int count, offset;

  BookListScreenErrorState(this.message, this.count, this.offset);
}

class BookListScreenBloc
    extends Bloc<BookListScreenEvent, BookListScreenState> {
  final HGraberClient _client;

  BookListScreenBloc(this._client) : super(BookListScreenLoadingState()) {
    on<LoadingBookListEvent>((event, emit) async {
      emit(BookListScreenLoadingState());
      try {
        final model = await _client.bookList(event.count, event.offset);
        emit(BookListScreenLoadedState(model, event.count, event.offset));
      } catch (e) {
        emit(BookListScreenErrorState(e.toString(), event.count, event.offset));
      }
    });
    on<RateBookListEvent>((event, emit) async {
      try {
        await _client.bookRate(event.bookID, event.rate);
        add(LoadingBookListEvent(event.count, event.offset));
      } catch (e) {
        emit(BookListScreenErrorState(e.toString(), event.count, event.offset));
      }
    });
  }
}
