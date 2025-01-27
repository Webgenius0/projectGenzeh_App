import 'dart:convert';

class LoginModel {
  bool? status;
  String? message;
  int? code;
  String? tokenType;
  Data? data;
  String? token;

  LoginModel({
    this.status,
    this.message,
    this.code,
    this.tokenType,
    this.data,
    this.token,
  });

  LoginModel copyWith({
    bool? status,
    String? message,
    int? code,
    String? tokenType,
    Data? data,
    String? token,
  }) =>
      LoginModel(
        status: status ?? this.status,
        message: message ?? this.message,
        code: code ?? this.code,
        tokenType: tokenType ?? this.tokenType,
        data: data ?? this.data,
        token: token ?? this.token,
      );

  factory LoginModel.fromRawJson(String str) =>
      LoginModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        message: json["message"],
        code: json["code"],
        tokenType: json["token_type"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "code": code,
        "token_type": tokenType,
        "data": data?.toJson(),
        "token": token,
      };
}

class Data {
  int? id;
  String? fullname;
  DateTime? dateOfBirth;
  String? country;
  String? username;
  String? email;
  String? image;
  dynamic providerId;
  DateTime? createdAt;
  DateTime? updatedAt;

  Data({
    this.id,
    this.fullname,
    this.dateOfBirth,
    this.country,
    this.username,
    this.email,
    this.image,
    this.providerId,
    this.createdAt,
    this.updatedAt,
  });

  Data copyWith({
    int? id,
    String? fullname,
    DateTime? dateOfBirth,
    String? country,
    String? username,
    String? email,
    String? image,
    dynamic providerId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Data(
        id: id ?? this.id,
        fullname: fullname ?? this.fullname,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        country: country ?? this.country,
        username: username ?? this.username,
        email: email ?? this.email,
        image: image ?? this.image,
        providerId: providerId ?? this.providerId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        fullname: json["fullname"],
        dateOfBirth: json["date_of_birth"] == null
            ? null
            : DateTime.parse(json["date_of_birth"]),
        country: json["country"],
        username: json["username"],
        email: json["email"],
        image: json["image"],
        providerId: json["provider_id"],
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
        "date_of_birth":
            "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
        "country": country,
        "username": username,
        "email": email,
        "image": image,
        "provider_id": providerId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
