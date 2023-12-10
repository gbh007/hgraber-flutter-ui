import 'main_state.dart';

export 'http.dart';
export 'main_state.dart';

abstract class HGraberClient {
  Future<MainInfoData> mainInfo();
}
