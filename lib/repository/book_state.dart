import 'package:json_annotation/json_annotation.dart';

import 'common.dart';

part 'book_state.g.dart';

@JsonSerializable()
class Book {
  final int id;
  final DateTime created;
  final String url;
  final List<Page> pages;
  final BookInfo info;

  Book({
    required this.id,
    required this.created,
    required this.url,
    required this.pages,
    required this.info,
  });

  List<String> urlsToView() {
    var out = List<String>.empty(growable: true);

    for (var i = 0; i < pages.length; i++) {
      var p = pages[i];

      if (!p.success) {
        continue;
      }

      out.add('${baseUrl}file/$id/${i + 1}.${p.ext}');
    }

    return out;
  }

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
  Map<String, dynamic> toJson() => _$BookToJson(this);
}

@JsonSerializable()
class Page {
  final String url;
  final String ext;
  final bool success;
  @JsonKey(name: 'loaded_at')
  final DateTime loadedAt;
  final int? rate;

  Page({
    required this.url,
    required this.ext,
    required this.success,
    required this.loadedAt,
    this.rate,
  });

  factory Page.fromJson(Map<String, dynamic> json) => _$PageFromJson(json);
  Map<String, dynamic> toJson() => _$PageToJson(this);
}

@JsonSerializable()
class BookInfo {
  final BookParsedInfo? parsed;
  final String? name;
  final int? rate;
  final List<String>? tags;
  final List<String>? authors;
  final List<String>? characters;
  final List<String>? languages;
  final List<String>? categories;
  final List<String>? parodies;
  final List<String>? groups;

  BookInfo({
    required this.parsed,
    required this.name,
    required this.rate,
    required this.tags,
    required this.authors,
    required this.characters,
    required this.languages,
    required this.categories,
    required this.parodies,
    required this.groups,
  });

  factory BookInfo.fromJson(Map<String, dynamic> json) =>
      _$BookInfoFromJson(json);
  Map<String, dynamic> toJson() => _$BookInfoToJson(this);
}

@JsonSerializable()
class BookParsedInfo {
  final bool? name;
  final bool? page;
  final bool? tags;
  final bool? authors;
  final bool? characters;
  final bool? languages;
  final bool? categories;
  final bool? parodies;
  final bool? groups;

  BookParsedInfo({
    required this.name,
    required this.page,
    required this.tags,
    required this.authors,
    required this.characters,
    required this.languages,
    required this.categories,
    required this.parodies,
    required this.groups,
  });

  factory BookParsedInfo.fromJson(Map<String, dynamic> json) =>
      _$BookParsedInfoFromJson(json);
  Map<String, dynamic> toJson() => _$BookParsedInfoToJson(this);
}
