import 'package:flutter_bloc/flutter_bloc.dart';
import 'model.dart';
import 'package:hgraber_ui/repository/repository.dart' show Repository;

sealed class HomeScreenEvent {}

class FetchDashboardEvent extends HomeScreenEvent {}

sealed class HomeScreenState {}

class HomeScreenLoadingState extends HomeScreenState {}

class HomeScreenLoadedState extends HomeScreenState {
  final Dashboard dashboard;
  final List<Worker> workers;

  HomeScreenLoadedState(this.dashboard, this.workers);
}

class HomeScreenErrorState extends HomeScreenState {
  final String message;

  HomeScreenErrorState(this.message);
}

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final Repository _repository;

  HomeScreenBloc(this._repository) : super(HomeScreenLoadingState()) {
    on<FetchDashboardEvent>((event, emit) async {
      emit(HomeScreenLoadingState());
      try {
        final model = await _repository.info();
        emit(HomeScreenLoadedState(
          Dashboard(
              count: model.count,
              notLoadCount: model.notLoadCount,
              notLoadPageCount: model.notLoadPageCount,
              pageCount: model.pageCount),
          model.workers != null
              ? model.workers!
                  .map((worker) => Worker(
                      name: worker.name,
                      inQueue: worker.inQueue,
                      inWork: worker.inWork,
                      runners: worker.runners))
                  .toList()
              : List.empty(),
        ));
      } catch (e) {
        emit(HomeScreenErrorState(e.toString()));
      }
    });
  }
}
