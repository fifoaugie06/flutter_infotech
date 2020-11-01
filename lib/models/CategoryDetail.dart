// To parse this JSON data, do
//
//     final categoryDetail = categoryDetailFromJson(jsonString);

import 'dart:convert';

CategoryDetail categoryDetailFromJson(String str) => CategoryDetail.fromJson(json.decode(str));

String categoryDetailToJson(CategoryDetail data) => json.encode(data.toJson());

class CategoryDetail {
  CategoryDetail({
    this.data,
    this.dataCount,
    this.message,
    this.status,
  });

  Data data;
  int dataCount;
  String message;
  int status;

  factory CategoryDetail.fromJson(Map<String, dynamic> json) => CategoryDetail(
    data: Data.fromJson(json["data"]),
    dataCount: json["data_count"],
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "data_count": dataCount,
    "message": message,
    "status": status,
  };
}

class Data {
  Data({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.titleNewsCategory,
    this.news,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  String titleNewsCategory;
  List<News> news;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["ID"],
    createdAt: DateTime.parse(json["CreatedAt"]),
    updatedAt: DateTime.parse(json["UpdatedAt"]),
    deletedAt: json["DeletedAt"],
    titleNewsCategory: json["TitleNewsCategory"],
    news: List<News>.from(json["News"].map((x) => News.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "CreatedAt": createdAt.toIso8601String(),
    "UpdatedAt": updatedAt.toIso8601String(),
    "DeletedAt": deletedAt,
    "TitleNewsCategory": titleNewsCategory,
    "News": List<dynamic>.from(news.map((x) => x.toJson())),
  };
}

class News {
  News({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.newsCategoryId,
    this.titleNews,
    this.content,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  int newsCategoryId;
  String titleNews;
  String content;

  factory News.fromJson(Map<String, dynamic> json) => News(
    id: json["ID"],
    createdAt: DateTime.parse(json["CreatedAt"]),
    updatedAt: DateTime.parse(json["UpdatedAt"]),
    deletedAt: json["DeletedAt"],
    newsCategoryId: json["NewsCategoryID"],
    titleNews: json["TitleNews"],
    content: json["Content"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "CreatedAt": createdAt.toIso8601String(),
    "UpdatedAt": updatedAt.toIso8601String(),
    "DeletedAt": deletedAt,
    "NewsCategoryID": newsCategoryId,
    "TitleNews": titleNews,
    "Content": content,
  };
}
