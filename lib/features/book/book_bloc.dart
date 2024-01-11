import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hgraber_ui/repository/repository.dart';

sealed class BookScreenEvent {}

class LoadingBookEvent extends BookScreenEvent {
  final int id;

  LoadingBookEvent(this.id);
}

class RateBookEvent extends BookScreenEvent {
  final int id, rate;

  RateBookEvent(this.id, this.rate);
}

class RateBookPageEvent extends BookScreenEvent {
  final int id, rate, pageNumber;

  RateBookPageEvent(this.id, this.pageNumber, this.rate);
}

sealed class BookScreenState {}

class BookScreenLoadingState extends BookScreenState {}

class BookScreenLoadedState extends BookScreenState {
  final BookDetailInfo model;

  BookScreenLoadedState(this.model);
}

class BookScreenErrorState extends BookScreenState {
  final String message;

  BookScreenErrorState(this.message);
}

class BookScreenBloc extends Bloc<BookScreenEvent, BookScreenState> {
  final Repository _repository;

  BookScreenBloc(this._repository) : super(BookScreenLoadingState()) {
    on<LoadingBookEvent>((event, emit) async {
      emit(BookScreenLoadingState());
      try {
        final model = await _repository.book(event.id);
        emit(BookScreenLoadedState(model));
      } catch (e) {
        emit(BookScreenErrorState(e.toString()));
      }
    });
    on<RateBookEvent>((event, emit) async {
      try {
        await _repository.updateBookRating(event.id, event.rate);
        add(LoadingBookEvent(event.id));
      } catch (e) {
        emit(BookScreenErrorState(
          e.toString(),
        ));
      }
    });
    on<RateBookPageEvent>((event, emit) async {
      try {
        await _repository.updatePageRating(event.id, event.pageNumber, event.rate);
        add(LoadingBookEvent(event.id));
      } catch (e) {
        emit(BookScreenErrorState(
          e.toString(),
        ));
      }
    });
  }
}
