import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'model.freezed.dart';

@freezed
class Worker with _$Worker {
  const factory Worker({
    required String name,
    required int inQueue,
    required int inWork,
    required int runners,
  }) = _Worker;
}

@freezed
class Dashboard with _$Dashboard {
  const factory Dashboard({
    required int count,
    required int notLoadCount,
    required int notLoadPageCount,
    required int pageCount,
  }) = _Dashboard;
}
