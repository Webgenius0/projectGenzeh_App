import 'dart:convert';

class SingleInsightModel {
  String? status;
  Data? data;

  SingleInsightModel({
    this.status,
    this.data,
  });

  SingleInsightModel copyWith({
    String? status,
    Data? data,
  }) =>
      SingleInsightModel(
        status: status ?? this.status,
        data: data ?? this.data,
      );

  factory SingleInsightModel.fromRawJson(String str) =>
      SingleInsightModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SingleInsightModel.fromJson(Map<String, dynamic> json) =>
      SingleInsightModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
      };
}

class Data {
  int? id;
  String? title;
  String? description;
  String? image;
  String? authorName;
  String? authorImage;
  String? createdAt;
  DateTime? updatedAt;

  Data({
    this.id,
    this.title,
    this.description,
    this.image,
    this.authorName,
    this.authorImage,
    this.createdAt,
    this.updatedAt,
  });

  Data copyWith({
    int? id,
    String? title,
    String? description,
    String? image,
    String? authorName,
    String? authorImage,
    String? createdAt,
    DateTime? updatedAt,
  }) =>
      Data(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        image: image ?? this.image,
        authorName: authorName ?? this.authorName,
        authorImage: authorImage ?? this.authorImage,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
        authorName: json["author_name"],
        authorImage: json["author_image"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "image": image,
        "author_name": authorName,
        "author_image": authorImage,
        "created_at": createdAt,
        "updated_at": updatedAt?.toIso8601String(),
      };
}
