import 'character.dart';

class ApiResponse {
  final Info info;
  final List<Character> results;

  ApiResponse({
    required this.info,
    required this.results,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      info: Info.fromJson(json['info']),
      results: (json['results'] as List)
          .map((character) => Character.fromJson(character))
          .toList(),
    );
  }
}

class Info {
  final int count;
  final int pages;
  final String? next;
  final String? prev;

  Info({
    required this.count,
    required this.pages,
    this.next,
    this.prev,
  });

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      count: json['count'],
      pages: json['pages'],
      next: json['next'],
      prev: json['prev'],
    );
  }
}
