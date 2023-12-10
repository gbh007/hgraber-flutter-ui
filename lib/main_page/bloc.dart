import 'package:bloc/bloc.dart';
import 'package:hgraber_ui/repository/http.dart';
import 'package:hgraber_ui/repository/main_state.dart';

class MainPageState extends Cubit<MainInfoData> {
  late final HGraberClient? _client;

  MainPageState({
    HGraberClient? client,
  }) : super(MainInfoData(
          count: 0,
          notLoadCount: 0,
          notLoadPageCount: 0,
          pageCount: 0,
        )) {
    this._client = client;
  }

  void fetch() {
    _client!.mainInfo().then((value) => emit(value));

    // emit(MainInfoData(
    //   count: 0,
    //   notLoadCount: 0,
    //   notLoadPageCount: 0,
    //   pageCount: 0,
    // ));
  }
}
