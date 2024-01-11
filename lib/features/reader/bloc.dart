import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hgraber_ui/repository/repository.dart';

sealed class ReaderScreenEvent {}

class LoadingBookEvent extends ReaderScreenEvent {
  final int id;
  final int currentPage;

  LoadingBookEvent(this.id, this.currentPage);
}

class RateBookPageEvent extends ReaderScreenEvent {
  final int id, page, rate;

  RateBookPageEvent(this.id, this.page, this.rate);
}

sealed class ReaderScreenState {}

class ReaderScreenLoadingState extends ReaderScreenState {}

class ReaderScreenLoadedState extends ReaderScreenState {
  final BookDetailInfo model;
  final int currentPage;

  ReaderScreenLoadedState(this.model, this.currentPage);
}

class ReaderScreenErrorState extends ReaderScreenState {
  final String message;
  final int currentPage;

  ReaderScreenErrorState(this.message, this.currentPage);
}

class ReaderScreenBloc extends Bloc<ReaderScreenEvent, ReaderScreenState> {
  final Repository _client;

  ReaderScreenBloc(this._client) : super(ReaderScreenLoadingState()) {
    on<LoadingBookEvent>((event, emit) async {
      emit(ReaderScreenLoadingState());
      try {
        final model = await _client.book(event.id);
        emit(ReaderScreenLoadedState(model, event.currentPage));
      } catch (e) {
        emit(ReaderScreenErrorState(e.toString(), event.currentPage));
      }
    });
    on<RateBookPageEvent>((event, emit) async {
      try {
        await _client.updatePageRating(event.id, event.page, event.rate);
        add(LoadingBookEvent(event.id, event.page));
      } catch (e) {
        emit(ReaderScreenErrorState(e.toString(), event.page));
      }
    });
  }
}

class CurrentPageCubit extends Cubit<int> {
  CurrentPageCubit(int v) : super(v);

  void forward() => emit(state + 1);
  void back() => emit(state - 1);
}
