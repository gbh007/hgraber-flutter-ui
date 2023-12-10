import 'package:bloc/bloc.dart';
import 'package:hgraber_ui/repository/repository.dart';

sealed class MainPageEvent {}

class FetchMainEvent extends MainPageEvent {}

sealed class MainPageState {}

class MainPageLoadingState extends MainPageState {}

class MainPageLoadedState extends MainPageState {
  final MainInfoData model;

  MainPageLoadedState(this.model);
}

class MainPageErrorState extends MainPageState {
  final String message;

  MainPageErrorState(this.message);
}

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  late final HGraberClient _client;

  MainPageBloc(this._client) : super(MainPageLoadingState()) {
    on<FetchMainEvent>((event, emit) async {
      emit(MainPageLoadingState());
      try {
        final model = await _client.mainInfo();
        emit(MainPageLoadedState(model));
      } catch (e) {
        emit(MainPageErrorState(e.toString()));
      }
    });
  }
}
