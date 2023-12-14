import 'package:bloc/bloc.dart';

import 'package:hgraber_ui/repository/repository.dart';

sealed class BookListScreenEvent {}

class LoadingBookListEvent extends BookListScreenEvent {
  int count, offset;
  LoadingBookListEvent(this.count, this.offset);
}

sealed class BookListScreenState {}

class BookListScreenLoadingState extends BookListScreenState {}

class BookListScreenLoadedState extends BookListScreenState {
  final List<Book> model;

  BookListScreenLoadedState(this.model);
}

class BookListScreenErrorState extends BookListScreenState {
  final String message;

  BookListScreenErrorState(this.message);
}

class BookListScreenBloc
    extends Bloc<BookListScreenEvent, BookListScreenState> {
  final HGraberClient _client;

  BookListScreenBloc(this._client) : super(BookListScreenLoadingState()) {
    on<LoadingBookListEvent>((event, emit) async {
      emit(BookListScreenLoadingState());
      try {
        final model = await _client.bookList(event.count, event.offset);
        emit(BookListScreenLoadedState(model));
      } catch (e) {
        emit(BookListScreenErrorState(e.toString()));
      }
    });
  }
}
