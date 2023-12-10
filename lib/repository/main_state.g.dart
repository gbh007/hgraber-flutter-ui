// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkerData _$WorkerDataFromJson(Map<String, dynamic> json) => WorkerData(
      name: json['name'] as String,
      inQueue: json['in_queue'] as int? ?? 0,
      inWork: json['in_work'] as int? ?? 0,
      runners: json['runners'] as int? ?? 0,
    );

Map<String, dynamic> _$WorkerDataToJson(WorkerData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'in_queue': instance.inQueue,
      'in_work': instance.inWork,
      'runners': instance.runners,
    };

MonitorData _$MonitorDataFromJson(Map<String, dynamic> json) => MonitorData(
      workers: (json['workers'] as List<dynamic>?)
          ?.map((e) => WorkerData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MonitorDataToJson(MonitorData instance) =>
    <String, dynamic>{
      'workers': instance.workers,
    };

MainInfoData _$MainInfoDataFromJson(Map<String, dynamic> json) => MainInfoData(
      monitor: json['monitor'] == null
          ? null
          : MonitorData.fromJson(json['monitor'] as Map<String, dynamic>),
      count: json['count'] as int? ?? 0,
      notLoadCount: json['not_load_count'] as int? ?? 0,
      notLoadPageCount: json['not_load_page_count'] as int? ?? 0,
      pageCount: json['page_count'] as int? ?? 0,
    );

Map<String, dynamic> _$MainInfoDataToJson(MainInfoData instance) =>
    <String, dynamic>{
      'monitor': instance.monitor,
      'count': instance.count,
      'not_load_count': instance.notLoadCount,
      'not_load_page_count': instance.notLoadPageCount,
      'page_count': instance.pageCount,
    };
