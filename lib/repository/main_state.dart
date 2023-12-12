import 'package:json_annotation/json_annotation.dart';

part 'main_state.g.dart';

@JsonSerializable()
class Worker {
  final String name;
  @JsonKey(name: "in_queue", defaultValue: 0)
  final int inQueue;
  @JsonKey(name: "in_work", defaultValue: 0)
  final int inWork;
  @JsonKey(defaultValue: 0)
  final int runners;

  Worker({
    required this.name,
    required this.inQueue,
    required this.inWork,
    required this.runners,
  });

  factory Worker.fromJson(Map<String, dynamic> json) =>
      _$WorkerFromJson(json);
  Map<String, dynamic> toJson() => _$WorkerToJson(this);
}

@JsonSerializable()
class Monitor {
  final List<Worker>? workers;

  Monitor({
    this.workers,
  });

  factory Monitor.fromJson(Map<String, dynamic> json) =>
      _$MonitorFromJson(json);
  Map<String, dynamic> toJson() => _$MonitorToJson(this);
}

@JsonSerializable()
class MainPageData {
  final Monitor? monitor;

  @JsonKey(defaultValue: 0)
  final int count;
  @JsonKey(name: "not_load_count", defaultValue: 0)
  final int notLoadCount;
  @JsonKey(name: "not_load_page_count", defaultValue: 0)
  final int notLoadPageCount;
  @JsonKey(name: "page_count", defaultValue: 0)
  final int pageCount;

  MainPageData({
    this.monitor,
    required this.count,
    required this.notLoadCount,
    required this.notLoadPageCount,
    required this.pageCount,
  });

  factory MainPageData.fromJson(Map<String, dynamic> json) =>
      _$MainPageDataFromJson(json);
  Map<String, dynamic> toJson() => _$MainPageDataToJson(this);
}
