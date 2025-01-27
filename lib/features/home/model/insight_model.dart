import 'dart:convert';

class InsightModel {
  String? status;
  List<Datum>? data;

  InsightModel({
    this.status,
    this.data,
  });

  InsightModel copyWith({
    String? status,
    List<Datum>? data,
  }) =>
      InsightModel(
        status: status ?? this.status,
        data: data ?? this.data,
      );

  factory InsightModel.fromRawJson(String str) =>
      InsightModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory InsightModel.fromJson(Map<String, dynamic> json) => InsightModel(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  int? id;
  String? title;
  String? description;
  String? image;
  String? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.title,
    this.description,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  Datum copyWith({
    int? id,
    String? title,
    String? description,
    String? image,
    String? createdAt,
    DateTime? updatedAt,
  }) =>
      Datum(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        image: image ?? this.image,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
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
        "created_at": createdAt,
        "updated_at": updatedAt?.toIso8601String(),
      };
}
