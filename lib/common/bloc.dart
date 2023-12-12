import 'package:bloc/bloc.dart';

import 'package:hgraber_ui/repository/repository.dart';

import 'model.dart';

sealed class GlobalEvent {}

class LoadingGlobalEvent extends GlobalEvent {}

class SetGlobalEvent extends GlobalEvent {
  final GlobalModel model;

  SetGlobalEvent(this.model);
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
  final HGraberClient _client;

  GlobalBloc(this._client) : super(GlobalLoadingState()) {
    on<SetGlobalEvent>((event, emit) {
      emit(GlobalLoadedState(event.model));
      // FIXME: костыль
      _client.updateBaseUrl(event.model.baseUrl);
    });
  }
}
