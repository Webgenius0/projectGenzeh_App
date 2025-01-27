import 'dart:convert';

class SignupModel {
    String? message;
    User? user;
    String? token;

    SignupModel({
        this.message,
        this.user,
        this.token,
    });

    SignupModel copyWith({
        String? message,
        User? user,
        String? token,
    }) => 
        SignupModel(
            message: message ?? this.message,
            user: user ?? this.user,
            token: token ?? this.token,
        );

    factory SignupModel.fromRawJson(String str) => SignupModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
        message: json["message"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "user": user?.toJson(),
        "token": token,
    };
}

class User {
    String? fullname;
    DateTime? dateOfBirth;
    String? country;
    String? username;
    String? email;
    dynamic image;
    DateTime? updatedAt;
    DateTime? createdAt;
    int? id;

    User({
        this.fullname,
        this.dateOfBirth,
        this.country,
        this.username,
        this.email,
        this.image,
        this.updatedAt,
        this.createdAt,
        this.id,
    });

    User copyWith({
        String? fullname,
        DateTime? dateOfBirth,
        String? country,
        String? username,
        String? email,
        dynamic image,
        DateTime? updatedAt,
        DateTime? createdAt,
        int? id,
    }) => 
        User(
            fullname: fullname ?? this.fullname,
            dateOfBirth: dateOfBirth ?? this.dateOfBirth,
            country: country ?? this.country,
            username: username ?? this.username,
            email: email ?? this.email,
            image: image ?? this.image,
            updatedAt: updatedAt ?? this.updatedAt,
            createdAt: createdAt ?? this.createdAt,
            id: id ?? this.id,
        );

    factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory User.fromJson(Map<String, dynamic> json) => User(
        fullname: json["fullname"],
        dateOfBirth: json["date_of_birth"] == null ? null : DateTime.parse(json["date_of_birth"]),
        country: json["country"],
        username: json["username"],
        email: json["email"],
        image: json["image"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "fullname": fullname,
        "date_of_birth": "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
        "country": country,
        "username": username,
        "email": email,
        "image": image,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
    };
}
