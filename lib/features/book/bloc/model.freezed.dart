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
  List<BookPagePreview> get pages => throw _privateConstructorUsedError;
  List<BookAttribute> get attributes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookCopyWith<Book> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookCopyWith<$Res> {
  factory $BookCopyWith(Book value, $Res Function(Book) then) =
      _$BookCopyWithImpl<$Res, Book>;
  @useResult
  $Res call(
      {String name,
      BookInfo info,
      String? previewUrl,
      List<BookPagePreview> pages,
      List<BookAttribute> attributes});

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
    Object? pages = null,
    Object? attributes = null,
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
      pages: null == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as List<BookPagePreview>,
      attributes: null == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as List<BookAttribute>,
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
      {String name,
      BookInfo info,
      String? previewUrl,
      List<BookPagePreview> pages,
      List<BookAttribute> attributes});

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
    Object? pages = null,
    Object? attributes = null,
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
      pages: null == pages
          ? _value._pages
          : pages // ignore: cast_nullable_to_non_nullable
              as List<BookPagePreview>,
      attributes: null == attributes
          ? _value._attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as List<BookAttribute>,
    ));
  }
}

/// @nodoc

class _$BookImpl with DiagnosticableTreeMixin implements _Book {
  const _$BookImpl(
      {required this.name,
      required this.info,
      this.previewUrl,
      required final List<BookPagePreview> pages,
      required final List<BookAttribute> attributes})
      : _pages = pages,
        _attributes = attributes;

  @override
  final String name;
  @override
  final BookInfo info;
  @override
  final String? previewUrl;
  final List<BookPagePreview> _pages;
  @override
  List<BookPagePreview> get pages {
    if (_pages is EqualUnmodifiableListView) return _pages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pages);
  }

  final List<BookAttribute> _attributes;
  @override
  List<BookAttribute> get attributes {
    if (_attributes is EqualUnmodifiableListView) return _attributes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attributes);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Book(name: $name, info: $info, previewUrl: $previewUrl, pages: $pages, attributes: $attributes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Book'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('info', info))
      ..add(DiagnosticsProperty('previewUrl', previewUrl))
      ..add(DiagnosticsProperty('pages', pages))
      ..add(DiagnosticsProperty('attributes', attributes));
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
            const DeepCollectionEquality().equals(other._pages, _pages) &&
            const DeepCollectionEquality()
                .equals(other._attributes, _attributes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      info,
      previewUrl,
      const DeepCollectionEquality().hash(_pages),
      const DeepCollectionEquality().hash(_attributes));

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
      required final List<BookPagePreview> pages,
      required final List<BookAttribute> attributes}) = _$BookImpl;

  @override
  String get name;
  @override
  BookInfo get info;
  @override
  String? get previewUrl;
  @override
  List<BookPagePreview> get pages;
  @override
  List<BookAttribute> get attributes;
  @override
  @JsonKey(ignore: true)
  _$$BookImplCopyWith<_$BookImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BookPagePreview {
  int get pageNumber => throw _privateConstructorUsedError;
  String? get previewUrl => throw _privateConstructorUsedError;
  int get rating => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookPagePreviewCopyWith<BookPagePreview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookPagePreviewCopyWith<$Res> {
  factory $BookPagePreviewCopyWith(
          BookPagePreview value, $Res Function(BookPagePreview) then) =
      _$BookPagePreviewCopyWithImpl<$Res, BookPagePreview>;
  @useResult
  $Res call({int pageNumber, String? previewUrl, int rating});
}

/// @nodoc
class _$BookPagePreviewCopyWithImpl<$Res, $Val extends BookPagePreview>
    implements $BookPagePreviewCopyWith<$Res> {
  _$BookPagePreviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageNumber = null,
    Object? previewUrl = freezed,
    Object? rating = null,
  }) {
    return _then(_value.copyWith(
      pageNumber: null == pageNumber
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
      previewUrl: freezed == previewUrl
          ? _value.previewUrl
          : previewUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookPagePreviewImplCopyWith<$Res>
    implements $BookPagePreviewCopyWith<$Res> {
  factory _$$BookPagePreviewImplCopyWith(_$BookPagePreviewImpl value,
          $Res Function(_$BookPagePreviewImpl) then) =
      __$$BookPagePreviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int pageNumber, String? previewUrl, int rating});
}

/// @nodoc
class __$$BookPagePreviewImplCopyWithImpl<$Res>
    extends _$BookPagePreviewCopyWithImpl<$Res, _$BookPagePreviewImpl>
    implements _$$BookPagePreviewImplCopyWith<$Res> {
  __$$BookPagePreviewImplCopyWithImpl(
      _$BookPagePreviewImpl _value, $Res Function(_$BookPagePreviewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageNumber = null,
    Object? previewUrl = freezed,
    Object? rating = null,
  }) {
    return _then(_$BookPagePreviewImpl(
      pageNumber: null == pageNumber
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
      previewUrl: freezed == previewUrl
          ? _value.previewUrl
          : previewUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$BookPagePreviewImpl
    with DiagnosticableTreeMixin
    implements _BookPagePreview {
  const _$BookPagePreviewImpl(
      {required this.pageNumber, this.previewUrl, required this.rating});

  @override
  final int pageNumber;
  @override
  final String? previewUrl;
  @override
  final int rating;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BookPagePreview(pageNumber: $pageNumber, previewUrl: $previewUrl, rating: $rating)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BookPagePreview'))
      ..add(DiagnosticsProperty('pageNumber', pageNumber))
      ..add(DiagnosticsProperty('previewUrl', previewUrl))
      ..add(DiagnosticsProperty('rating', rating));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookPagePreviewImpl &&
            (identical(other.pageNumber, pageNumber) ||
                other.pageNumber == pageNumber) &&
            (identical(other.previewUrl, previewUrl) ||
                other.previewUrl == previewUrl) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pageNumber, previewUrl, rating);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookPagePreviewImplCopyWith<_$BookPagePreviewImpl> get copyWith =>
      __$$BookPagePreviewImplCopyWithImpl<_$BookPagePreviewImpl>(
          this, _$identity);
}

abstract class _BookPagePreview implements BookPagePreview {
  const factory _BookPagePreview(
      {required final int pageNumber,
      final String? previewUrl,
      required final int rating}) = _$BookPagePreviewImpl;

  @override
  int get pageNumber;
  @override
  String? get previewUrl;
  @override
  int get rating;
  @override
  @JsonKey(ignore: true)
  _$$BookPagePreviewImplCopyWith<_$BookPagePreviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BookAttribute {
  String get name => throw _privateConstructorUsedError;
  List<String> get values => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookAttributeCopyWith<BookAttribute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookAttributeCopyWith<$Res> {
  factory $BookAttributeCopyWith(
          BookAttribute value, $Res Function(BookAttribute) then) =
      _$BookAttributeCopyWithImpl<$Res, BookAttribute>;
  @useResult
  $Res call({String name, List<String> values});
}

/// @nodoc
class _$BookAttributeCopyWithImpl<$Res, $Val extends BookAttribute>
    implements $BookAttributeCopyWith<$Res> {
  _$BookAttributeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? values = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      values: null == values
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookAttributeImplCopyWith<$Res>
    implements $BookAttributeCopyWith<$Res> {
  factory _$$BookAttributeImplCopyWith(
          _$BookAttributeImpl value, $Res Function(_$BookAttributeImpl) then) =
      __$$BookAttributeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, List<String> values});
}

/// @nodoc
class __$$BookAttributeImplCopyWithImpl<$Res>
    extends _$BookAttributeCopyWithImpl<$Res, _$BookAttributeImpl>
    implements _$$BookAttributeImplCopyWith<$Res> {
  __$$BookAttributeImplCopyWithImpl(
      _$BookAttributeImpl _value, $Res Function(_$BookAttributeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? values = null,
  }) {
    return _then(_$BookAttributeImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      values: null == values
          ? _value._values
          : values // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$BookAttributeImpl
    with DiagnosticableTreeMixin
    implements _BookAttribute {
  const _$BookAttributeImpl(
      {required this.name, required final List<String> values})
      : _values = values;

  @override
  final String name;
  final List<String> _values;
  @override
  List<String> get values {
    if (_values is EqualUnmodifiableListView) return _values;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_values);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BookAttribute(name: $name, values: $values)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BookAttribute'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('values', values));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookAttributeImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._values, _values));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(_values));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookAttributeImplCopyWith<_$BookAttributeImpl> get copyWith =>
      __$$BookAttributeImplCopyWithImpl<_$BookAttributeImpl>(this, _$identity);
}

abstract class _BookAttribute implements BookAttribute {
  const factory _BookAttribute(
      {required final String name,
      required final List<String> values}) = _$BookAttributeImpl;

  @override
  String get name;
  @override
  List<String> get values;
  @override
  @JsonKey(ignore: true)
  _$$BookAttributeImplCopyWith<_$BookAttributeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
