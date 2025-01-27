import 'dart:convert';

class OnboardModel {
  int? status;
  String? message;

  OnboardModel({
    this.status,
    this.message,
  });

  OnboardModel copyWith({
    int? status,
    String? message,
  }) =>
      OnboardModel(
        status: status ?? this.status,
        message: message ?? this.message,
      );

  factory OnboardModel.fromRawJson(String str) =>
      OnboardModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OnboardModel.fromJson(Map<String, dynamic> json) => OnboardModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
