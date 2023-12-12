import 'package:bloc/bloc.dart';
import 'package:hgraber_ui/repository/repository.dart';

sealed class BookScreenEvent {}

class LoadingBookEvent extends BookScreenEvent {
  int id;
  LoadingBookEvent(this.id);
}

sealed class BookScreenState {}

class BookScreenLoadingState extends BookScreenState {}

class BookScreenLoadedState extends BookScreenState {
  final Book model;

  BookScreenLoadedState(this.model);
}

class BookScreenErrorState extends BookScreenState {
  final String message;

  BookScreenErrorState(this.message);
}

class BookScreenBloc extends Bloc<BookScreenEvent, BookScreenState> {
  final HGraberClient _client;

  BookScreenBloc(this._client) : super(BookScreenLoadingState()) {
    on<LoadingBookEvent>((event, emit) async {
      emit(BookScreenLoadingState());
      try {
        final model = await _client.bookInfo(event.id);
        emit(BookScreenLoadedState(model));
      } catch (e) {
        emit(BookScreenErrorState(e.toString()));
      }
    });
  }
}
