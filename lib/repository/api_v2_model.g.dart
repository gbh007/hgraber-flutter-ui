// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_v2_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

APIv2BookShortInfo _$APIv2BookShortInfoFromJson(Map<String, dynamic> json) =>
    APIv2BookShortInfo(
      id: json['id'] as int,
      created: DateTime.parse(json['created'] as String),
      previewUrl: json['preview_url'] as String?,
      parsedName: json['parsed_name'] as bool,
      name: json['name'] as String,
      parsedPage: json['parsed_page'] as bool,
      pageCount: json['page_count'] as int,
      pageLoadedPercent: (json['page_loaded_percent'] as num).toDouble(),
      rate: json['rate'] as int,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      hasMoreTags: json['has_more_tags'] as bool,
    );

Map<String, dynamic> _$APIv2BookShortInfoToJson(APIv2BookShortInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created': instance.created.toIso8601String(),
      'preview_url': instance.previewUrl,
      'parsed_name': instance.parsedName,
      'name': instance.name,
      'parsed_page': instance.parsedPage,
      'page_count': instance.pageCount,
      'page_loaded_percent': instance.pageLoadedPercent,
      'rate': instance.rate,
      'tags': instance.tags,
      'has_more_tags': instance.hasMoreTags,
    };

APIv2PageForPagination _$APIv2PageForPaginationFromJson(
        Map<String, dynamic> json) =>
    APIv2PageForPagination(
      value: json['value'] as int,
      isCurrent: json['is_current'] as bool,
      isSeparator: json['is_separator'] as bool,
    );

Map<String, dynamic> _$APIv2PageForPaginationToJson(
        APIv2PageForPagination instance) =>
    <String, dynamic>{
      'value': instance.value,
      'is_current': instance.isCurrent,
      'is_separator': instance.isSeparator,
    };

APIv2BookListResponse _$APIv2BookListResponseFromJson(
        Map<String, dynamic> json) =>
    APIv2BookListResponse(
      books: (json['books'] as List<dynamic>)
          .map((e) => APIv2BookShortInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      pages: (json['pages'] as List<dynamic>)
          .map(
              (e) => APIv2PageForPagination.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$APIv2BookListResponseToJson(
        APIv2BookListResponse instance) =>
    <String, dynamic>{
      'books': instance.books,
      'pages': instance.pages,
    };

APIv2BookDetailInfo _$APIv2BookDetailInfoFromJson(Map<String, dynamic> json) =>
    APIv2BookDetailInfo(
      id: json['id'] as int,
      created: DateTime.parse(json['created'] as String),
      previewUrl: json['preview_url'] as String?,
      parsedName: json['parsed_name'] as bool,
      name: json['name'] as String,
      parsedPage: json['parsed_page'] as bool,
      pageCount: json['page_count'] as int,
      pageLoadedPercent: (json['page_loaded_percent'] as num).toDouble(),
      rate: json['rate'] as int,
      pages: (json['pages'] as List<dynamic>?)
          ?.map((e) =>
              APIv2BookDetailPagePreview.fromJson(e as Map<String, dynamic>))
          .toList(),
      attributes: (json['attributes'] as List<dynamic>?)
          ?.map((e) =>
              APIv2BookDetailAttributeInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$APIv2BookDetailInfoToJson(
        APIv2BookDetailInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created': instance.created.toIso8601String(),
      'preview_url': instance.previewUrl,
      'parsed_name': instance.parsedName,
      'name': instance.name,
      'parsed_page': instance.parsedPage,
      'page_count': instance.pageCount,
      'page_loaded_percent': instance.pageLoadedPercent,
      'rate': instance.rate,
      'pages': instance.pages,
      'attributes': instance.attributes,
    };

APIv2BookDetailPagePreview _$APIv2BookDetailPagePreviewFromJson(
        Map<String, dynamic> json) =>
    APIv2BookDetailPagePreview(
      pageNumber: json['page_number'] as int,
      previewUrl: json['preview_url'] as String?,
      rate: json['rate'] as int,
    );

Map<String, dynamic> _$APIv2BookDetailPagePreviewToJson(
        APIv2BookDetailPagePreview instance) =>
    <String, dynamic>{
      'page_number': instance.pageNumber,
      'preview_url': instance.previewUrl,
      'rate': instance.rate,
    };

APIv2BookDetailAttributeInfo _$APIv2BookDetailAttributeInfoFromJson(
        Map<String, dynamic> json) =>
    APIv2BookDetailAttributeInfo(
      name: json['name'] as String,
      values:
          (json['values'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$APIv2BookDetailAttributeInfoToJson(
        APIv2BookDetailAttributeInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'values': instance.values,
    };

APIv2Worker _$APIv2WorkerFromJson(Map<String, dynamic> json) => APIv2Worker(
      name: json['name'] as String,
      inQueue: json['in_queue'] as int? ?? 0,
      inWork: json['in_work'] as int? ?? 0,
      runners: json['runners'] as int? ?? 0,
    );

Map<String, dynamic> _$APIv2WorkerToJson(APIv2Worker instance) =>
    <String, dynamic>{
      'name': instance.name,
      'in_queue': instance.inQueue,
      'in_work': instance.inWork,
      'runners': instance.runners,
    };

APIv2Monitor _$APIv2MonitorFromJson(Map<String, dynamic> json) => APIv2Monitor(
      workers: (json['workers'] as List<dynamic>?)
          ?.map((e) => APIv2Worker.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$APIv2MonitorToJson(APIv2Monitor instance) =>
    <String, dynamic>{
      'workers': instance.workers,
    };

APIv2Dashboard _$APIv2DashboardFromJson(Map<String, dynamic> json) =>
    APIv2Dashboard(
      monitor: json['monitor'] == null
          ? null
          : APIv2Monitor.fromJson(json['monitor'] as Map<String, dynamic>),
      count: json['count'] as int? ?? 0,
      notLoadCount: json['not_load_count'] as int? ?? 0,
      notLoadPageCount: json['not_load_page_count'] as int? ?? 0,
      pageCount: json['page_count'] as int? ?? 0,
    );

Map<String, dynamic> _$APIv2DashboardToJson(APIv2Dashboard instance) =>
    <String, dynamic>{
      'monitor': instance.monitor,
      'count': instance.count,
      'not_load_count': instance.notLoadCount,
      'not_load_page_count': instance.notLoadPageCount,
      'page_count': instance.pageCount,
    };
