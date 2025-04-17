class SourceModel {
  String status;
  List<Source> sources;

  SourceModel({
    required this.status,
    required this.sources,
  });

  factory SourceModel.fromJson(Map<String, dynamic> json) => SourceModel(
        status: json["status"],
        sources:
            (json["sources"] as List).map((e) => Source.fromJson(e)).toList(),
      );
}

class Source {
  String id;
  String name;
  String description;
  String url;
  String category;
  String language;
  String country;

  Source({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
    required this.category,
    required this.language,
    required this.country,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        url: json["url"],
        category: json["category"],
        language: json["language"],
        country: json["country"],
      );
}
