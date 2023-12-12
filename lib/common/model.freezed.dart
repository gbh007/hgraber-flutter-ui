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
mixin _$GlobalModel {
  String get baseUrl => throw _privateConstructorUsedError;
  double get scale => throw _privateConstructorUsedError;
  int get bookOnPage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GlobalModelCopyWith<GlobalModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GlobalModelCopyWith<$Res> {
  factory $GlobalModelCopyWith(
          GlobalModel value, $Res Function(GlobalModel) then) =
      _$GlobalModelCopyWithImpl<$Res, GlobalModel>;
  @useResult
  $Res call({String baseUrl, double scale, int bookOnPage});
}

/// @nodoc
class _$GlobalModelCopyWithImpl<$Res, $Val extends GlobalModel>
    implements $GlobalModelCopyWith<$Res> {
  _$GlobalModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseUrl = null,
    Object? scale = null,
    Object? bookOnPage = null,
  }) {
    return _then(_value.copyWith(
      baseUrl: null == baseUrl
          ? _value.baseUrl
          : baseUrl // ignore: cast_nullable_to_non_nullable
              as String,
      scale: null == scale
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as double,
      bookOnPage: null == bookOnPage
          ? _value.bookOnPage
          : bookOnPage // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GlobalModelImplCopyWith<$Res>
    implements $GlobalModelCopyWith<$Res> {
  factory _$$GlobalModelImplCopyWith(
          _$GlobalModelImpl value, $Res Function(_$GlobalModelImpl) then) =
      __$$GlobalModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String baseUrl, double scale, int bookOnPage});
}

/// @nodoc
class __$$GlobalModelImplCopyWithImpl<$Res>
    extends _$GlobalModelCopyWithImpl<$Res, _$GlobalModelImpl>
    implements _$$GlobalModelImplCopyWith<$Res> {
  __$$GlobalModelImplCopyWithImpl(
      _$GlobalModelImpl _value, $Res Function(_$GlobalModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseUrl = null,
    Object? scale = null,
    Object? bookOnPage = null,
  }) {
    return _then(_$GlobalModelImpl(
      baseUrl: null == baseUrl
          ? _value.baseUrl
          : baseUrl // ignore: cast_nullable_to_non_nullable
              as String,
      scale: null == scale
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as double,
      bookOnPage: null == bookOnPage
          ? _value.bookOnPage
          : bookOnPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GlobalModelImpl with DiagnosticableTreeMixin implements _GlobalModel {
  const _$GlobalModelImpl(
      {required this.baseUrl, required this.scale, required this.bookOnPage});

  @override
  final String baseUrl;
  @override
  final double scale;
  @override
  final int bookOnPage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GlobalModel(baseUrl: $baseUrl, scale: $scale, bookOnPage: $bookOnPage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GlobalModel'))
      ..add(DiagnosticsProperty('baseUrl', baseUrl))
      ..add(DiagnosticsProperty('scale', scale))
      ..add(DiagnosticsProperty('bookOnPage', bookOnPage));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GlobalModelImpl &&
            (identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl) &&
            (identical(other.scale, scale) || other.scale == scale) &&
            (identical(other.bookOnPage, bookOnPage) ||
                other.bookOnPage == bookOnPage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, baseUrl, scale, bookOnPage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GlobalModelImplCopyWith<_$GlobalModelImpl> get copyWith =>
      __$$GlobalModelImplCopyWithImpl<_$GlobalModelImpl>(this, _$identity);
}

abstract class _GlobalModel implements GlobalModel {
  const factory _GlobalModel(
      {required final String baseUrl,
      required final double scale,
      required final int bookOnPage}) = _$GlobalModelImpl;

  @override
  String get baseUrl;
  @override
  double get scale;
  @override
  int get bookOnPage;
  @override
  @JsonKey(ignore: true)
  _$$GlobalModelImplCopyWith<_$GlobalModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
