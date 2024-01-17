import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'model.freezed.dart';

@freezed
class GlobalModel with _$GlobalModel {
  const factory GlobalModel({
    required String baseUrl,
    required String token,
    required double scale,
    required int bookOnPage,
  }) = _GlobalModel;
}