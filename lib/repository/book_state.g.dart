// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) => Book(
      id: json['id'] as int,
      created: DateTime.parse(json['created'] as String),
      url: json['url'] as String,
      pages: (json['pages'] as List<dynamic>)
          .map((e) => Page.fromJson(e as Map<String, dynamic>))
          .toList(),
      info: BookInfo.fromJson(json['info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      'id': instance.id,
      'created': instance.created.toIso8601String(),
      'url': instance.url,
      'pages': instance.pages,
      'info': instance.info,
    };

Page _$PageFromJson(Map<String, dynamic> json) => Page(
      url: json['url'] as String,
      ext: json['ext'] as String,
      success: json['success'] as bool,
      loadedAt: DateTime.parse(json['loaded_at'] as String),
      rate: json['rate'] as int?,
    );

Map<String, dynamic> _$PageToJson(Page instance) => <String, dynamic>{
      'url': instance.url,
      'ext': instance.ext,
      'success': instance.success,
      'loaded_at': instance.loadedAt.toIso8601String(),
      'rate': instance.rate,
    };

BookInfo _$BookInfoFromJson(Map<String, dynamic> json) => BookInfo(
      parsed: json['parsed'] == null
          ? null
          : BookParsedInfo.fromJson(json['parsed'] as Map<String, dynamic>),
      name: json['name'] as String?,
      rate: json['rate'] as int?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      authors:
          (json['authors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      characters: (json['characters'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      languages: (json['languages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      parodies: (json['parodies'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      groups:
          (json['groups'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$BookInfoToJson(BookInfo instance) => <String, dynamic>{
      'parsed': instance.parsed,
      'name': instance.name,
      'rate': instance.rate,
      'tags': instance.tags,
      'authors': instance.authors,
      'characters': instance.characters,
      'languages': instance.languages,
      'categories': instance.categories,
      'parodies': instance.parodies,
      'groups': instance.groups,
    };

BookParsedInfo _$BookParsedInfoFromJson(Map<String, dynamic> json) =>
    BookParsedInfo(
      name: json['name'] as bool?,
      page: json['page'] as bool?,
      tags: json['tags'] as bool?,
      authors: json['authors'] as bool?,
      characters: json['characters'] as bool?,
      languages: json['languages'] as bool?,
      categories: json['categories'] as bool?,
      parodies: json['parodies'] as bool?,
      groups: json['groups'] as bool?,
    );

Map<String, dynamic> _$BookParsedInfoToJson(BookParsedInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'page': instance.page,
      'tags': instance.tags,
      'authors': instance.authors,
      'characters': instance.characters,
      'languages': instance.languages,
      'categories': instance.categories,
      'parodies': instance.parodies,
      'groups': instance.groups,
    };
