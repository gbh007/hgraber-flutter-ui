import 'package:json_annotation/json_annotation.dart';

part 'main_state.g.dart';

@JsonSerializable()
class WorkerData {
  final String name;
  @JsonKey(name: "in_queue", defaultValue: 0)
  final int inQueue;
  @JsonKey(name: "in_work", defaultValue: 0)
  final int inWork;
  @JsonKey(defaultValue: 0)
  final int runners;

  WorkerData({
    required this.name,
    required this.inQueue,
    required this.inWork,
    required this.runners,
  });

  factory WorkerData.fromJson(Map<String, dynamic> json) =>
      _$WorkerDataFromJson(json);
  Map<String, dynamic> toJson() => _$WorkerDataToJson(this);
}

@JsonSerializable()
class MonitorData {
  final List<WorkerData>? workers;

  MonitorData({
    this.workers,
  });

  factory MonitorData.fromJson(Map<String, dynamic> json) =>
      _$MonitorDataFromJson(json);
  Map<String, dynamic> toJson() => _$MonitorDataToJson(this);
}

@JsonSerializable()
class MainInfoData {
  final MonitorData? monitor;

  @JsonKey(defaultValue: 0)
  final int count;
  @JsonKey(name: "not_load_count", defaultValue: 0)
  final int notLoadCount;
  @JsonKey(name: "not_load_page_count", defaultValue: 0)
  final int notLoadPageCount;
  @JsonKey(name: "page_count", defaultValue: 0)
  final int pageCount;

  MainInfoData({
    this.monitor,
    required this.count,
    required this.notLoadCount,
    required this.notLoadPageCount,
    required this.pageCount,
  });

  factory MainInfoData.fromJson(Map<String, dynamic> json) =>
      _$MainInfoDataFromJson(json);
  Map<String, dynamic> toJson() => _$MainInfoDataToJson(this);
}
