import 'dart:convert';

class ScanModel {
    List<Datum>? data;

    ScanModel({
        this.data,
    });

    ScanModel copyWith({
        List<Datum>? data,
    }) => 
        ScanModel(
            data: data ?? this.data,
        );

    factory ScanModel.fromRawJson(String str) => ScanModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
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

    Datum({
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

    Datum copyWith({
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
        Datum(
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

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
