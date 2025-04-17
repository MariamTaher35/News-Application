class ArticalsModel {
  String? status;
  List<Articles>? articles;

  ArticalsModel({
    this.status,
    this.articles,
  });

  ArticalsModel.fromJson(dynamic json) {
    status = json['status'];
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles?.add(Articles.fromJson(v));
      });
    }
  }
}

/// source : {"id":"bbc-news","name":"BBC News"}
/// author : "BBC News"
/// title : "Next Mission: Impossible film delayed by a year by US actors' strike"
/// description : "The eighth movie in the hit Tom Cruise franchise won't now be released until May 2025."
/// url : "http://www.bbc.co.uk/news/entertainment-arts-67203951"
/// urlToImage : "https://ichef.bbci.co.uk/news/1024/branded_news/B0C3/production/_131515254_gettyimages-1535082031.jpg"
/// publishedAt : "2023-10-24T16:37:25.0676545Z"
/// content : "The latest Mission: Impossible film has been delayed by almost a year after production was halted because of the ongoing Hollywood actors' strike.\r\nThe eighth film in the franchise will now be releas… [+2489 chars]"

class Articles {
  SourceArtical? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Articles({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  Articles.fromJson(dynamic json) {
    source =
        json['source'] != null ? SourceArtical.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }
}

/// id : "bbc-news"
/// name : "BBC News"

class SourceArtical {
  SourceArtical({
    this.id,
    this.name,
  });

  SourceArtical.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }

  String? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}
