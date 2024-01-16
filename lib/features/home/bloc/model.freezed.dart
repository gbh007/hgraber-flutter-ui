// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Worker {
  String get name => throw _privateConstructorUsedError;
  int get inQueue => throw _privateConstructorUsedError;
  int get inWork => throw _privateConstructorUsedError;
  int get runners => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WorkerCopyWith<Worker> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkerCopyWith<$Res> {
  factory $WorkerCopyWith(Worker value, $Res Function(Worker) then) =
      _$WorkerCopyWithImpl<$Res, Worker>;
  @useResult
  $Res call({String name, int inQueue, int inWork, int runners});
}

/// @nodoc
class _$WorkerCopyWithImpl<$Res, $Val extends Worker>
    implements $WorkerCopyWith<$Res> {
  _$WorkerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? inQueue = null,
    Object? inWork = null,
    Object? runners = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      inQueue: null == inQueue
          ? _value.inQueue
          : inQueue // ignore: cast_nullable_to_non_nullable
              as int,
      inWork: null == inWork
          ? _value.inWork
          : inWork // ignore: cast_nullable_to_non_nullable
              as int,
      runners: null == runners
          ? _value.runners
          : runners // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkerImplCopyWith<$Res> implements $WorkerCopyWith<$Res> {
  factory _$$WorkerImplCopyWith(
          _$WorkerImpl value, $Res Function(_$WorkerImpl) then) =
      __$$WorkerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int inQueue, int inWork, int runners});
}

/// @nodoc
class __$$WorkerImplCopyWithImpl<$Res>
    extends _$WorkerCopyWithImpl<$Res, _$WorkerImpl>
    implements _$$WorkerImplCopyWith<$Res> {
  __$$WorkerImplCopyWithImpl(
      _$WorkerImpl _value, $Res Function(_$WorkerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? inQueue = null,
    Object? inWork = null,
    Object? runners = null,
  }) {
    return _then(_$WorkerImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      inQueue: null == inQueue
          ? _value.inQueue
          : inQueue // ignore: cast_nullable_to_non_nullable
              as int,
      inWork: null == inWork
          ? _value.inWork
          : inWork // ignore: cast_nullable_to_non_nullable
              as int,
      runners: null == runners
          ? _value.runners
          : runners // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$WorkerImpl with DiagnosticableTreeMixin implements _Worker {
  const _$WorkerImpl(
      {required this.name,
      required this.inQueue,
      required this.inWork,
      required this.runners});

  @override
  final String name;
  @override
  final int inQueue;
  @override
  final int inWork;
  @override
  final int runners;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Worker(name: $name, inQueue: $inQueue, inWork: $inWork, runners: $runners)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Worker'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('inQueue', inQueue))
      ..add(DiagnosticsProperty('inWork', inWork))
      ..add(DiagnosticsProperty('runners', runners));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkerImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.inQueue, inQueue) || other.inQueue == inQueue) &&
            (identical(other.inWork, inWork) || other.inWork == inWork) &&
            (identical(other.runners, runners) || other.runners == runners));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, inQueue, inWork, runners);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkerImplCopyWith<_$WorkerImpl> get copyWith =>
      __$$WorkerImplCopyWithImpl<_$WorkerImpl>(this, _$identity);
}

abstract class _Worker implements Worker {
  const factory _Worker(
      {required final String name,
      required final int inQueue,
      required final int inWork,
      required final int runners}) = _$WorkerImpl;

  @override
  String get name;
  @override
  int get inQueue;
  @override
  int get inWork;
  @override
  int get runners;
  @override
  @JsonKey(ignore: true)
  _$$WorkerImplCopyWith<_$WorkerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Dashboard {
  int get count => throw _privateConstructorUsedError;
  int get notLoadCount => throw _privateConstructorUsedError;
  int get notLoadPageCount => throw _privateConstructorUsedError;
  int get pageCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DashboardCopyWith<Dashboard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardCopyWith<$Res> {
  factory $DashboardCopyWith(Dashboard value, $Res Function(Dashboard) then) =
      _$DashboardCopyWithImpl<$Res, Dashboard>;
  @useResult
  $Res call({int count, int notLoadCount, int notLoadPageCount, int pageCount});
}

/// @nodoc
class _$DashboardCopyWithImpl<$Res, $Val extends Dashboard>
    implements $DashboardCopyWith<$Res> {
  _$DashboardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? notLoadCount = null,
    Object? notLoadPageCount = null,
    Object? pageCount = null,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      notLoadCount: null == notLoadCount
          ? _value.notLoadCount
          : notLoadCount // ignore: cast_nullable_to_non_nullable
              as int,
      notLoadPageCount: null == notLoadPageCount
          ? _value.notLoadPageCount
          : notLoadPageCount // ignore: cast_nullable_to_non_nullable
              as int,
      pageCount: null == pageCount
          ? _value.pageCount
          : pageCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DashboardImplCopyWith<$Res>
    implements $DashboardCopyWith<$Res> {
  factory _$$DashboardImplCopyWith(
          _$DashboardImpl value, $Res Function(_$DashboardImpl) then) =
      __$$DashboardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int count, int notLoadCount, int notLoadPageCount, int pageCount});
}

/// @nodoc
class __$$DashboardImplCopyWithImpl<$Res>
    extends _$DashboardCopyWithImpl<$Res, _$DashboardImpl>
    implements _$$DashboardImplCopyWith<$Res> {
  __$$DashboardImplCopyWithImpl(
      _$DashboardImpl _value, $Res Function(_$DashboardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? notLoadCount = null,
    Object? notLoadPageCount = null,
    Object? pageCount = null,
  }) {
    return _then(_$DashboardImpl(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      notLoadCount: null == notLoadCount
          ? _value.notLoadCount
          : notLoadCount // ignore: cast_nullable_to_non_nullable
              as int,
      notLoadPageCount: null == notLoadPageCount
          ? _value.notLoadPageCount
          : notLoadPageCount // ignore: cast_nullable_to_non_nullable
              as int,
      pageCount: null == pageCount
          ? _value.pageCount
          : pageCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DashboardImpl with DiagnosticableTreeMixin implements _Dashboard {
  const _$DashboardImpl(
      {required this.count,
      required this.notLoadCount,
      required this.notLoadPageCount,
      required this.pageCount});

  @override
  final int count;
  @override
  final int notLoadCount;
  @override
  final int notLoadPageCount;
  @override
  final int pageCount;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Dashboard(count: $count, notLoadCount: $notLoadCount, notLoadPageCount: $notLoadPageCount, pageCount: $pageCount)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Dashboard'))
      ..add(DiagnosticsProperty('count', count))
      ..add(DiagnosticsProperty('notLoadCount', notLoadCount))
      ..add(DiagnosticsProperty('notLoadPageCount', notLoadPageCount))
      ..add(DiagnosticsProperty('pageCount', pageCount));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardImpl &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.notLoadCount, notLoadCount) ||
                other.notLoadCount == notLoadCount) &&
            (identical(other.notLoadPageCount, notLoadPageCount) ||
                other.notLoadPageCount == notLoadPageCount) &&
            (identical(other.pageCount, pageCount) ||
                other.pageCount == pageCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, count, notLoadCount, notLoadPageCount, pageCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardImplCopyWith<_$DashboardImpl> get copyWith =>
      __$$DashboardImplCopyWithImpl<_$DashboardImpl>(this, _$identity);
}

abstract class _Dashboard implements Dashboard {
  const factory _Dashboard(
      {required final int count,
      required final int notLoadCount,
      required final int notLoadPageCount,
      required final int pageCount}) = _$DashboardImpl;

  @override
  int get count;
  @override
  int get notLoadCount;
  @override
  int get notLoadPageCount;
  @override
  int get pageCount;
  @override
  @JsonKey(ignore: true)
  _$$DashboardImplCopyWith<_$DashboardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
