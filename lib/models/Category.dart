// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
  Category({
    this.data,
    this.dataCount,
    this.message,
    this.status,
  });

  List<Datum> data;
  int dataCount;
  String message;
  int status;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        dataCount: json["data_count"],
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "data_count": dataCount,
        "message": message,
        "status": status,
      };
}

class Datum {
  Datum({
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
  dynamic news;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["ID"],
        createdAt: DateTime.parse(json["CreatedAt"]),
        updatedAt: DateTime.parse(json["UpdatedAt"]),
        deletedAt: json["DeletedAt"],
        titleNewsCategory: json["TitleNewsCategory"],
        news: json["News"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "CreatedAt": createdAt.toIso8601String(),
        "UpdatedAt": updatedAt.toIso8601String(),
        "DeletedAt": deletedAt,
        "TitleNewsCategory": titleNewsCategory,
        "News": news,
      };
}
