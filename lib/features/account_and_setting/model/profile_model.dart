import 'dart:convert';

class ProfileModel {
  String? message;
  Data? data;

  ProfileModel({
    this.message,
    this.data,
  });

  ProfileModel copyWith({
    String? message,
    Data? data,
  }) =>
      ProfileModel(
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory ProfileModel.fromRawJson(String str) =>
      ProfileModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  int? id;
  String? fullname;
  String? username;
  String? email;
  String? phone;
  DateTime? dateOfBirth;
  String? country;
  String? gender;
  dynamic image;
  DateTime? createdAt;
  DateTime? updatedAt;

  Data({
    this.id,
    this.fullname,
    this.username,
    this.email,
    this.phone,
    this.dateOfBirth,
    this.country,
    this.gender,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  Data copyWith({
    int? id,
    String? fullname,
    String? username,
    String? email,
    String? phone,
    DateTime? dateOfBirth,
    String? country,
    String? gender,
    dynamic image,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Data(
        id: id ?? this.id,
        fullname: fullname ?? this.fullname,
        username: username ?? this.username,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        country: country ?? this.country,
        gender: gender ?? this.gender,
        image: image ?? this.image,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        fullname: json["fullname"],
        username: json["username"],
        email: json["email"],
        phone: json["phone"],
        dateOfBirth: json["date_of_birth"] == null
            ? null
            : DateTime.parse(json["date_of_birth"]),
        country: json["country"],
        gender: json["gender"],
        image: json["image"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullname": fullname,
        "username": username,
        "email": email,
        "phone": phone,
        "date_of_birth":
            "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
        "country": country,
        "gender": gender,
        "image": image,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
