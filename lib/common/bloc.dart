import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hgraber_ui/repository/repository.dart';

import 'model.dart';

class GlobalBloc extends Cubit<GlobalModel> {
  final Repository _repository;

  GlobalBloc(this._repository)
      : super(const GlobalModel(baseUrl: baseUrl, scale: 1.0, bookOnPage: 20));

  void updateModel(GlobalModel data) {
    emit(data);
    _repository.updateBaseUrl(data.baseUrl);
  }
}
