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
    List<String>? tags,
  }) = _Book;
}

@freezed
class BooksPage with _$BooksPage {
  const factory BooksPage({
    required int value,
    required bool isCurrent,
    required bool isSeparator,
  }) = _BooksPage;
}
