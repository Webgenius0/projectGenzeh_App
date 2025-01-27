import 'dart:convert';

class HistoryDetailsModel {
    Data? data;

    HistoryDetailsModel({
        this.data,
    });

    HistoryDetailsModel copyWith({
        Data? data,
    }) => 
        HistoryDetailsModel(
            data: data ?? this.data,
        );

    factory HistoryDetailsModel.fromRawJson(String str) => HistoryDetailsModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory HistoryDetailsModel.fromJson(Map<String, dynamic> json) => HistoryDetailsModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
    };
}

class Data {
    int? id;
    int? userId;
    String? name;
    String? imagePath;
    String? text;
    String? microplastic;
    String? riskLevel;
    String? score;
    String? description;
    String? healthImpact;
    String? howToImprove;
    String? recommendationTips;
    String? createdAt;
    DateTime? updatedAt;
    String? imageUrl;

    Data({
        this.id,
        this.userId,
        this.name,
        this.imagePath,
        this.text,
        this.microplastic,
        this.riskLevel,
        this.score,
        this.description,
        this.healthImpact,
        this.howToImprove,
        this.recommendationTips,
        this.createdAt,
        this.updatedAt,
        this.imageUrl,
    });

    Data copyWith({
        int? id,
        int? userId,
        String? name,
        String? imagePath,
        String? text,
        String? microplastic,
        String? riskLevel,
        String? score,
        String? description,
        String? healthImpact,
        String? howToImprove,
        String? recommendationTips,
        String? createdAt,
        DateTime? updatedAt,
        String? imageUrl,
    }) => 
        Data(
            id: id ?? this.id,
            userId: userId ?? this.userId,
            name: name ?? this.name,
            imagePath: imagePath ?? this.imagePath,
            text: text ?? this.text,
            microplastic: microplastic ?? this.microplastic,
            riskLevel: riskLevel ?? this.riskLevel,
            score: score ?? this.score,
            description: description ?? this.description,
            healthImpact: healthImpact ?? this.healthImpact,
            howToImprove: howToImprove ?? this.howToImprove,
            recommendationTips: recommendationTips ?? this.recommendationTips,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            imageUrl: imageUrl ?? this.imageUrl,
        );

    factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
        imagePath: json["image_path"],
        text: json["text"],
        microplastic: json["microplastic"],
        riskLevel: json["risk_level"],
        score: json["score"],
        description: json["description"],
        healthImpact: json["health_impact"],
        howToImprove: json["how_to_improve"],
        recommendationTips: json["recommendation_tips"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        imageUrl: json["image_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "name": name,
        "image_path": imagePath,
        "text": text,
        "microplastic": microplastic,
        "risk_level": riskLevel,
        "score": score,
        "description": description,
        "health_impact": healthImpact,
        "how_to_improve": howToImprove,
        "recommendation_tips": recommendationTips,
        "created_at": createdAt,
        "updated_at": updatedAt?.toIso8601String(),
        "image_url": imageUrl,
    };
}
