import 'package:bloc/bloc.dart';

import 'model.dart';

sealed class GlobalEvent {}

class LoadingGlobalEvent extends GlobalEvent {}

class LoadedGlobalEvent extends GlobalEvent {
  final GlobalModel model;

  LoadedGlobalEvent(this.model);
}

sealed class GlobalState {}

class GlobalLoadingState extends GlobalState {}

class GlobalLoadedState extends GlobalState {
  final GlobalModel model;

  GlobalLoadedState(this.model);
}

class GlobalErrorState extends GlobalState {
  final String message;

  GlobalErrorState(this.message);
}

class GlobalBloc extends Bloc<GlobalEvent, GlobalState> {
  GlobalBloc() : super(GlobalLoadingState()) {
    on<LoadedGlobalEvent>((event, emit) {
      emit(GlobalLoadedState(event.model));
    });
  }
}
