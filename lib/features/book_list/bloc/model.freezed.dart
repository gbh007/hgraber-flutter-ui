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
mixin _$BookInfo {
  int get id => throw _privateConstructorUsedError;
  DateTime get created => throw _privateConstructorUsedError;
  bool get parsedName => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get parsedPage => throw _privateConstructorUsedError;
  int get pageCount => throw _privateConstructorUsedError;
  double get pageLoadedPercent => throw _privateConstructorUsedError;
  int get rating => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookInfoCopyWith<BookInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookInfoCopyWith<$Res> {
  factory $BookInfoCopyWith(BookInfo value, $Res Function(BookInfo) then) =
      _$BookInfoCopyWithImpl<$Res, BookInfo>;
  @useResult
  $Res call(
      {int id,
      DateTime created,
      bool parsedName,
      String name,
      bool parsedPage,
      int pageCount,
      double pageLoadedPercent,
      int rating});
}

/// @nodoc
class _$BookInfoCopyWithImpl<$Res, $Val extends BookInfo>
    implements $BookInfoCopyWith<$Res> {
  _$BookInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? created = null,
    Object? parsedName = null,
    Object? name = null,
    Object? parsedPage = null,
    Object? pageCount = null,
    Object? pageLoadedPercent = null,
    Object? rating = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      parsedName: null == parsedName
          ? _value.parsedName
          : parsedName // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      parsedPage: null == parsedPage
          ? _value.parsedPage
          : parsedPage // ignore: cast_nullable_to_non_nullable
              as bool,
      pageCount: null == pageCount
          ? _value.pageCount
          : pageCount // ignore: cast_nullable_to_non_nullable
              as int,
      pageLoadedPercent: null == pageLoadedPercent
          ? _value.pageLoadedPercent
          : pageLoadedPercent // ignore: cast_nullable_to_non_nullable
              as double,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookInfoImplCopyWith<$Res>
    implements $BookInfoCopyWith<$Res> {
  factory _$$BookInfoImplCopyWith(
          _$BookInfoImpl value, $Res Function(_$BookInfoImpl) then) =
      __$$BookInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      DateTime created,
      bool parsedName,
      String name,
      bool parsedPage,
      int pageCount,
      double pageLoadedPercent,
      int rating});
}

/// @nodoc
class __$$BookInfoImplCopyWithImpl<$Res>
    extends _$BookInfoCopyWithImpl<$Res, _$BookInfoImpl>
    implements _$$BookInfoImplCopyWith<$Res> {
  __$$BookInfoImplCopyWithImpl(
      _$BookInfoImpl _value, $Res Function(_$BookInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? created = null,
    Object? parsedName = null,
    Object? name = null,
    Object? parsedPage = null,
    Object? pageCount = null,
    Object? pageLoadedPercent = null,
    Object? rating = null,
  }) {
    return _then(_$BookInfoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      parsedName: null == parsedName
          ? _value.parsedName
          : parsedName // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      parsedPage: null == parsedPage
          ? _value.parsedPage
          : parsedPage // ignore: cast_nullable_to_non_nullable
              as bool,
      pageCount: null == pageCount
          ? _value.pageCount
          : pageCount // ignore: cast_nullable_to_non_nullable
              as int,
      pageLoadedPercent: null == pageLoadedPercent
          ? _value.pageLoadedPercent
          : pageLoadedPercent // ignore: cast_nullable_to_non_nullable
              as double,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$BookInfoImpl with DiagnosticableTreeMixin implements _BookInfo {
  const _$BookInfoImpl(
      {required this.id,
      required this.created,
      required this.parsedName,
      required this.name,
      required this.parsedPage,
      required this.pageCount,
      required this.pageLoadedPercent,
      required this.rating});

  @override
  final int id;
  @override
  final DateTime created;
  @override
  final bool parsedName;
  @override
  final String name;
  @override
  final bool parsedPage;
  @override
  final int pageCount;
  @override
  final double pageLoadedPercent;
  @override
  final int rating;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BookInfo(id: $id, created: $created, parsedName: $parsedName, name: $name, parsedPage: $parsedPage, pageCount: $pageCount, pageLoadedPercent: $pageLoadedPercent, rating: $rating)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BookInfo'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('created', created))
      ..add(DiagnosticsProperty('parsedName', parsedName))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('parsedPage', parsedPage))
      ..add(DiagnosticsProperty('pageCount', pageCount))
      ..add(DiagnosticsProperty('pageLoadedPercent', pageLoadedPercent))
      ..add(DiagnosticsProperty('rating', rating));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.parsedName, parsedName) ||
                other.parsedName == parsedName) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.parsedPage, parsedPage) ||
                other.parsedPage == parsedPage) &&
            (identical(other.pageCount, pageCount) ||
                other.pageCount == pageCount) &&
            (identical(other.pageLoadedPercent, pageLoadedPercent) ||
                other.pageLoadedPercent == pageLoadedPercent) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, created, parsedName, name,
      parsedPage, pageCount, pageLoadedPercent, rating);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookInfoImplCopyWith<_$BookInfoImpl> get copyWith =>
      __$$BookInfoImplCopyWithImpl<_$BookInfoImpl>(this, _$identity);
}

abstract class _BookInfo implements BookInfo {
  const factory _BookInfo(
      {required final int id,
      required final DateTime created,
      required final bool parsedName,
      required final String name,
      required final bool parsedPage,
      required final int pageCount,
      required final double pageLoadedPercent,
      required final int rating}) = _$BookInfoImpl;

  @override
  int get id;
  @override
  DateTime get created;
  @override
  bool get parsedName;
  @override
  String get name;
  @override
  bool get parsedPage;
  @override
  int get pageCount;
  @override
  double get pageLoadedPercent;
  @override
  int get rating;
  @override
  @JsonKey(ignore: true)
  _$$BookInfoImplCopyWith<_$BookInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Book {
  String get name => throw _privateConstructorUsedError;
  BookInfo get info => throw _privateConstructorUsedError;
  String? get previewUrl => throw _privateConstructorUsedError;
  List<String>? get tags => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookCopyWith<Book> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookCopyWith<$Res> {
  factory $BookCopyWith(Book value, $Res Function(Book) then) =
      _$BookCopyWithImpl<$Res, Book>;
  @useResult
  $Res call(
      {String name, BookInfo info, String? previewUrl, List<String>? tags});

  $BookInfoCopyWith<$Res> get info;
}

/// @nodoc
class _$BookCopyWithImpl<$Res, $Val extends Book>
    implements $BookCopyWith<$Res> {
  _$BookCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? info = null,
    Object? previewUrl = freezed,
    Object? tags = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as BookInfo,
      previewUrl: freezed == previewUrl
          ? _value.previewUrl
          : previewUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BookInfoCopyWith<$Res> get info {
    return $BookInfoCopyWith<$Res>(_value.info, (value) {
      return _then(_value.copyWith(info: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BookImplCopyWith<$Res> implements $BookCopyWith<$Res> {
  factory _$$BookImplCopyWith(
          _$BookImpl value, $Res Function(_$BookImpl) then) =
      __$$BookImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name, BookInfo info, String? previewUrl, List<String>? tags});

  @override
  $BookInfoCopyWith<$Res> get info;
}

/// @nodoc
class __$$BookImplCopyWithImpl<$Res>
    extends _$BookCopyWithImpl<$Res, _$BookImpl>
    implements _$$BookImplCopyWith<$Res> {
  __$$BookImplCopyWithImpl(_$BookImpl _value, $Res Function(_$BookImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? info = null,
    Object? previewUrl = freezed,
    Object? tags = freezed,
  }) {
    return _then(_$BookImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as BookInfo,
      previewUrl: freezed == previewUrl
          ? _value.previewUrl
          : previewUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

class _$BookImpl with DiagnosticableTreeMixin implements _Book {
  const _$BookImpl(
      {required this.name,
      required this.info,
      this.previewUrl,
      final List<String>? tags})
      : _tags = tags;

  @override
  final String name;
  @override
  final BookInfo info;
  @override
  final String? previewUrl;
  final List<String>? _tags;
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Book(name: $name, info: $info, previewUrl: $previewUrl, tags: $tags)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Book'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('info', info))
      ..add(DiagnosticsProperty('previewUrl', previewUrl))
      ..add(DiagnosticsProperty('tags', tags));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.info, info) || other.info == info) &&
            (identical(other.previewUrl, previewUrl) ||
                other.previewUrl == previewUrl) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, info, previewUrl,
      const DeepCollectionEquality().hash(_tags));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookImplCopyWith<_$BookImpl> get copyWith =>
      __$$BookImplCopyWithImpl<_$BookImpl>(this, _$identity);
}

abstract class _Book implements Book {
  const factory _Book(
      {required final String name,
      required final BookInfo info,
      final String? previewUrl,
      final List<String>? tags}) = _$BookImpl;

  @override
  String get name;
  @override
  BookInfo get info;
  @override
  String? get previewUrl;
  @override
  List<String>? get tags;
  @override
  @JsonKey(ignore: true)
  _$$BookImplCopyWith<_$BookImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BooksPage {
  int get value => throw _privateConstructorUsedError;
  bool get isCurrent => throw _privateConstructorUsedError;
  bool get isSeparator => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BooksPageCopyWith<BooksPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BooksPageCopyWith<$Res> {
  factory $BooksPageCopyWith(BooksPage value, $Res Function(BooksPage) then) =
      _$BooksPageCopyWithImpl<$Res, BooksPage>;
  @useResult
  $Res call({int value, bool isCurrent, bool isSeparator});
}

/// @nodoc
class _$BooksPageCopyWithImpl<$Res, $Val extends BooksPage>
    implements $BooksPageCopyWith<$Res> {
  _$BooksPageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? isCurrent = null,
    Object? isSeparator = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      isCurrent: null == isCurrent
          ? _value.isCurrent
          : isCurrent // ignore: cast_nullable_to_non_nullable
              as bool,
      isSeparator: null == isSeparator
          ? _value.isSeparator
          : isSeparator // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BooksPageImplCopyWith<$Res>
    implements $BooksPageCopyWith<$Res> {
  factory _$$BooksPageImplCopyWith(
          _$BooksPageImpl value, $Res Function(_$BooksPageImpl) then) =
      __$$BooksPageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int value, bool isCurrent, bool isSeparator});
}

/// @nodoc
class __$$BooksPageImplCopyWithImpl<$Res>
    extends _$BooksPageCopyWithImpl<$Res, _$BooksPageImpl>
    implements _$$BooksPageImplCopyWith<$Res> {
  __$$BooksPageImplCopyWithImpl(
      _$BooksPageImpl _value, $Res Function(_$BooksPageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? isCurrent = null,
    Object? isSeparator = null,
  }) {
    return _then(_$BooksPageImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      isCurrent: null == isCurrent
          ? _value.isCurrent
          : isCurrent // ignore: cast_nullable_to_non_nullable
              as bool,
      isSeparator: null == isSeparator
          ? _value.isSeparator
          : isSeparator // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$BooksPageImpl with DiagnosticableTreeMixin implements _BooksPage {
  const _$BooksPageImpl(
      {required this.value,
      required this.isCurrent,
      required this.isSeparator});

  @override
  final int value;
  @override
  final bool isCurrent;
  @override
  final bool isSeparator;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BooksPage(value: $value, isCurrent: $isCurrent, isSeparator: $isSeparator)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BooksPage'))
      ..add(DiagnosticsProperty('value', value))
      ..add(DiagnosticsProperty('isCurrent', isCurrent))
      ..add(DiagnosticsProperty('isSeparator', isSeparator));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BooksPageImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.isCurrent, isCurrent) ||
                other.isCurrent == isCurrent) &&
            (identical(other.isSeparator, isSeparator) ||
                other.isSeparator == isSeparator));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value, isCurrent, isSeparator);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BooksPageImplCopyWith<_$BooksPageImpl> get copyWith =>
      __$$BooksPageImplCopyWithImpl<_$BooksPageImpl>(this, _$identity);
}

abstract class _BooksPage implements BooksPage {
  const factory _BooksPage(
      {required final int value,
      required final bool isCurrent,
      required final bool isSeparator}) = _$BooksPageImpl;

  @override
  int get value;
  @override
  bool get isCurrent;
  @override
  bool get isSeparator;
  @override
  @JsonKey(ignore: true)
  _$$BooksPageImplCopyWith<_$BooksPageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
