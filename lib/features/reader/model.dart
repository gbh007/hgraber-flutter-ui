import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'model.freezed.dart';

@freezed
class Book with _$Book {
  const factory Book({
    required String name,
    required int pageCount,
    required List<Page> pages,
  }) = _Book;
}

@freezed
class Page with _$Page {
  const factory Page({
    required int pageNumber,
    String? previewUrl,
    required int rating,
  }) = _Page;
}
