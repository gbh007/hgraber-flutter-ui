import 'package:json_annotation/json_annotation.dart';

part 'api_v2_model.g.dart';

@JsonSerializable()
class APIv2BookShortInfo {
  final int id;

  final DateTime created;

  @JsonKey(name: 'preview_url')
  final String? previewUrl;

  @JsonKey(name: 'parsed_name')
  final bool parsedName;

  final String name;

  @JsonKey(name: 'parsed_page')
  final bool parsedPage;

  @JsonKey(name: 'page_count')
  final int pageCount;

  @JsonKey(name: 'page_loaded_percent')
  final double pageLoadedPercent;

  final int rate;

  final List<String>? tags;

  @JsonKey(name: 'has_more_tags')
  final bool hasMoreTags;

  APIv2BookShortInfo({
    required this.id,
    required this.created,
    this.previewUrl,
    required this.parsedName,
    required this.name,
    required this.parsedPage,
    required this.pageCount,
    required this.pageLoadedPercent,
    required this.rate,
    this.tags,
    required this.hasMoreTags,
  });

  factory APIv2BookShortInfo.fromJson(Map<String, dynamic> json) =>
      _$APIv2BookShortInfoFromJson(json);
  Map<String, dynamic> toJson() => _$APIv2BookShortInfoToJson(this);
}

@JsonSerializable()
class APIv2PageForPagination {
  final int value;
  @JsonKey(name: 'is_current')
  final bool isCurrent;
  @JsonKey(name: 'is_separator')
  final bool isSeparator;

  APIv2PageForPagination({
    required this.value,
    required this.isCurrent,
    required this.isSeparator,
  });

  factory APIv2PageForPagination.fromJson(Map<String, dynamic> json) =>
      _$APIv2PageForPaginationFromJson(json);
  Map<String, dynamic> toJson() => _$APIv2PageForPaginationToJson(this);
}

@JsonSerializable()
class APIv2BookListResponse {
  final List<APIv2BookShortInfo> books;
  final List<APIv2PageForPagination> pages;

  APIv2BookListResponse({
    required this.books,
    required this.pages,
  });

  factory APIv2BookListResponse.fromJson(Map<String, dynamic> json) =>
      _$APIv2BookListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$APIv2BookListResponseToJson(this);
}

@JsonSerializable()
class APIv2BookDetailInfo {
  final int id;

  final DateTime created;

  @JsonKey(name: 'preview_url')
  final String? previewUrl;

  @JsonKey(name: 'parsed_name')
  final bool parsedName;

  final String name;

  @JsonKey(name: 'parsed_page')
  final bool parsedPage;

  @JsonKey(name: 'page_count')
  final int pageCount;

  @JsonKey(name: 'page_loaded_percent')
  final double pageLoadedPercent;

  final int rate;

  final List<APIv2BookDetailPagePreview>? pages;
  final List<APIv2BookDetailAttributeInfo>? attributes;

  APIv2BookDetailInfo({
    required this.id,
    required this.created,
    this.previewUrl,
    required this.parsedName,
    required this.name,
    required this.parsedPage,
    required this.pageCount,
    required this.pageLoadedPercent,
    required this.rate,
    this.pages,
    this.attributes,
  });

  factory APIv2BookDetailInfo.fromJson(Map<String, dynamic> json) =>
      _$APIv2BookDetailInfoFromJson(json);
  Map<String, dynamic> toJson() => _$APIv2BookDetailInfoToJson(this);
}

@JsonSerializable()
class APIv2BookDetailPagePreview {
  @JsonKey(name: 'page_number')
  final int pageNumber;

  @JsonKey(name: 'preview_url')
  final String? previewUrl;

  final int rate;

  APIv2BookDetailPagePreview({
    required this.pageNumber,
    this.previewUrl,
    required this.rate,
  });

  factory APIv2BookDetailPagePreview.fromJson(Map<String, dynamic> json) =>
      _$APIv2BookDetailPagePreviewFromJson(json);
  Map<String, dynamic> toJson() => _$APIv2BookDetailPagePreviewToJson(this);
}

@JsonSerializable()
class APIv2BookDetailAttributeInfo {
  final String name;
  final List<String> values;

  APIv2BookDetailAttributeInfo({
    required this.name,
    required this.values,
  });

  factory APIv2BookDetailAttributeInfo.fromJson(Map<String, dynamic> json) =>
      _$APIv2BookDetailAttributeInfoFromJson(json);
  Map<String, dynamic> toJson() => _$APIv2BookDetailAttributeInfoToJson(this);
}


@JsonSerializable()
class APIv2Worker {
  final String name;
  @JsonKey(name: "in_queue", defaultValue: 0)
  final int inQueue;
  @JsonKey(name: "in_work", defaultValue: 0)
  final int inWork;
  @JsonKey(defaultValue: 0)
  final int runners;

  APIv2Worker({
    required this.name,
    required this.inQueue,
    required this.inWork,
    required this.runners,
  });

  factory APIv2Worker.fromJson(Map<String, dynamic> json) => _$APIv2WorkerFromJson(json);
  Map<String, dynamic> toJson() => _$APIv2WorkerToJson(this);
}

@JsonSerializable()
class APIv2Monitor {
  final List<APIv2Worker>? workers;

  APIv2Monitor({
    this.workers,
  });

  factory APIv2Monitor.fromJson(Map<String, dynamic> json) =>
      _$APIv2MonitorFromJson(json);
  Map<String, dynamic> toJson() => _$APIv2MonitorToJson(this);
}

@JsonSerializable()
class APIv2Dashboard {
  final APIv2Monitor? monitor;

  @JsonKey(defaultValue: 0)
  final int count;
  @JsonKey(name: "not_load_count", defaultValue: 0)
  final int notLoadCount;
  @JsonKey(name: "not_load_page_count", defaultValue: 0)
  final int notLoadPageCount;
  @JsonKey(name: "page_count", defaultValue: 0)
  final int pageCount;

  APIv2Dashboard({
    this.monitor,
    required this.count,
    required this.notLoadCount,
    required this.notLoadPageCount,
    required this.pageCount,
  });

  factory APIv2Dashboard.fromJson(Map<String, dynamic> json) =>
      _$APIv2DashboardFromJson(json);
  Map<String, dynamic> toJson() => _$APIv2DashboardToJson(this);
}
