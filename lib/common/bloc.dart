import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hgraber_ui/repository/repository.dart';

import 'model.dart';

class GlobalBloc extends Cubit<GlobalModel> {
  final HGraberClient _client;

  GlobalBloc(this._client)
      : super(const GlobalModel(baseUrl: baseUrl, scale: 1.0, bookOnPage: 20));

  void updateModel(GlobalModel data) {
    emit(data);
    _client.updateBaseUrl(data.baseUrl);
  }
}
