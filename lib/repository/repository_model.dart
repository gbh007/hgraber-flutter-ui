import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'repository_model.freezed.dart';

@freezed
class BookShortInfo with _$BookShortInfo {
  const factory BookShortInfo({
    required int id,
    required DateTime created,
    String? previewUrl,
    required bool parsedName,
    required String name,
    required bool parsedPage,
    required int pageCount,
    required double pageLoadedPercent,
    required int rating,
    List<String>? tags,
    required bool hasMoreTags,
  }) = _BookShortInfo;
}

@freezed
class PageForPagination with _$PageForPagination {
  const factory PageForPagination({
    required int value,
    required bool isCurrent,
    required bool isSeparator,
  }) = _PageForPagination;
}

@freezed
class BookListResponse with _$BookListResponse {
  const factory BookListResponse({
    required List<BookShortInfo> books,
    required List<PageForPagination> pages,
  }) = _BookListResponse;
}

@freezed
class BookDetailInfo with _$BookDetailInfo {
  const factory BookDetailInfo({
    required int id,
    required DateTime created,
    String? previewUrl,
    required bool parsedName,
    required String name,
    required bool parsedPage,
    required int pageCount,
    required double pageLoadedPercent,
    required int rating,
    List<BookDetailPagePreview>? pages,
    List<BookDetailAttributeInfo>? attributes,
  }) = _BookDetailInfo;
}

@freezed
class BookDetailPagePreview with _$BookDetailPagePreview {
  const factory BookDetailPagePreview({
    required int pageNumber,
    String? previewUrl,
    required int rating,
  }) = _BookDetailPagePreview;
}

@freezed
class BookDetailAttributeInfo with _$BookDetailAttributeInfo {
  const factory BookDetailAttributeInfo({
    required String name,
    required List<String> values,
  }) = _BookDetailAttributeInfo;
}

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
    List<Worker>? workers,
    required int count,
    required int notLoadCount,
    required int notLoadPageCount,
    required int pageCount,
  }) = _Dashboard;
}
