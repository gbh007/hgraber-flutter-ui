import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'model.freezed.dart';

@freezed
class BookInfo with _$BookInfo {
  const factory BookInfo({
    required final int id,
    required final DateTime created,
    required final bool parsedName,
    required final String name,
    required final bool parsedPage,
    required final int pageCount,
    required final double pageLoadedPercent,
    required final int rating,
  }) = _BookInfo;
}

@freezed
class Book with _$Book {
  const factory Book({
    required String name,
    required BookInfo info,
    String? previewUrl,
    required List<BookPagePreview> pages,
    required List<BookAttribute> attributes,
  }) = _Book;
}

@freezed
class BookPagePreview with _$BookPagePreview {
  const factory BookPagePreview({
    required int pageNumber,
    String? previewUrl,
    required int rate,
  }) = _BookPagePreview;
}

@freezed
class BookAttribute with _$BookAttribute {
  const factory BookAttribute({
    required String name,
    required List<String> values,
  }) = _BookAttribute;
}
