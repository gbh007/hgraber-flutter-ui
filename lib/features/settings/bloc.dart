import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hgraber_ui/common/global.dart';

sealed class SettingsEvent {}

class SetSettingsEvent extends SettingsEvent {
  final GlobalModel model;

  SetSettingsEvent(this.model);
}

class ApplySettingsEvent extends SettingsEvent {
  final GlobalModel model;

  ApplySettingsEvent(this.model);
}

sealed class SettingsState {}

class SettingsLoadingState extends SettingsState {}

class SettingsLoadedState extends SettingsState {
  final GlobalModel model;

  SettingsLoadedState(this.model);
}

class SettingsErrorState extends SettingsState {
  final String message;

  SettingsErrorState(this.message);
}

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final GlobalBloc global;

  SettingsBloc(this.global) : super(SettingsLoadingState()) {
    on<SetSettingsEvent>((event, emit) async {
      emit(SettingsLoadedState(event.model));
    });
    on<ApplySettingsEvent>((event, emit) async {
      emit(SettingsLoadedState(event.model));
      global.add(SetGlobalEvent(event.model));
    });
  }
}
