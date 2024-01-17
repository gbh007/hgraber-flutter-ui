import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hgraber_ui/repository/repository.dart' show Repository;

import 'model.dart';

sealed class ReaderScreenEvent {}

class LoadingBookEvent extends ReaderScreenEvent {
  final int id;

  LoadingBookEvent(this.id);
}

class UpdateBookPageRatingEvent extends ReaderScreenEvent {
  final int id, page, rating;

  UpdateBookPageRatingEvent(this.id, this.page, this.rating);
}

sealed class ReaderScreenState {}

class ReaderScreenLoadingState extends ReaderScreenState {}

class ReaderScreenLoadedState extends ReaderScreenState {
  final Book book;

  ReaderScreenLoadedState(this.book);
}

class ReaderScreenErrorState extends ReaderScreenState {
  final String message;

  ReaderScreenErrorState(this.message);
}

class ReaderScreenBloc extends Bloc<ReaderScreenEvent, ReaderScreenState> {
  final Repository _client;

  ReaderScreenBloc(this._client) : super(ReaderScreenLoadingState()) {
    on<LoadingBookEvent>((event, emit) async {
      emit(ReaderScreenLoadingState());
      try {
        final model = await _client.book(event.id);
        emit(ReaderScreenLoadedState(
          Book(
            name: model.name,
            pageCount: model.pageCount,
            pages: model.pages
                    ?.map((page) => Page(
                          pageNumber: page.pageNumber,
                          rating: page.rating,
                          previewUrl: page.previewUrl,
                        ))
                    .toList() ??
                List.empty(),
          ),
        ));
      } catch (e) {
        emit(ReaderScreenErrorState(e.toString()));
      }
    });
    on<UpdateBookPageRatingEvent>((event, emit) async {
      try {
        await _client.updatePageRating(event.id, event.page, event.rating);
        add(LoadingBookEvent(event.id));
      } catch (e) {
        emit(ReaderScreenErrorState(e.toString()));
      }
    });
  }
}

class CurrentPageCubit extends Cubit<int> {
  CurrentPageCubit(int v) : super(v);

  void forward(int count) {
    final currentPage = max(1, min(state, count));
    if (currentPage < count) {
      emit(currentPage + 1);
    }
  }

  void back(int count) {
    final currentPage = max(1, min(state, count));
    if (currentPage > 1) {
      emit(currentPage - 1);
    }
  }
}
