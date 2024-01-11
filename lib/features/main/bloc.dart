import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hgraber_ui/repository/repository.dart';

sealed class MainPageEvent {}

class FetchMainEvent extends MainPageEvent {}

sealed class MainPageState {}

class MainPageLoadingState extends MainPageState {}

class MainPageLoadedState extends MainPageState {
  final Dashboard model;

  MainPageLoadedState(this.model);
}

class MainPageErrorState extends MainPageState {
  final String message;

  MainPageErrorState(this.message);
}

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  final Repository _repository;

  MainPageBloc(this._repository) : super(MainPageLoadingState()) {
    on<FetchMainEvent>((event, emit) async {
      emit(MainPageLoadingState());
      try {
        final model = await _repository.info();
        emit(MainPageLoadedState(model));
      } catch (e) {
        emit(MainPageErrorState(e.toString()));
      }
    });
  }
}
