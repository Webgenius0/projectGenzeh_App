import 'dart:convert';

class ScanResultModel {
    String? status;
    MicroplasticsInfo? microplasticsInfo;
    int? dbRecordId;
    int? userId;

    ScanResultModel({
        this.status,
        this.microplasticsInfo,
        this.dbRecordId,
        this.userId,
    });

    ScanResultModel copyWith({
        String? status,
        MicroplasticsInfo? microplasticsInfo,
        int? dbRecordId,
        int? userId,
    }) => 
        ScanResultModel(
            status: status ?? this.status,
            microplasticsInfo: microplasticsInfo ?? this.microplasticsInfo,
            dbRecordId: dbRecordId ?? this.dbRecordId,
            userId: userId ?? this.userId,
        );

    factory ScanResultModel.fromRawJson(String str) => ScanResultModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ScanResultModel.fromJson(Map<String, dynamic> json) => ScanResultModel(
        status: json["status"],
        microplasticsInfo: json["microplasticsInfo"] == null ? null : MicroplasticsInfo.fromJson(json["microplasticsInfo"]),
        dbRecordId: json["db_record_id"],
        userId: json["user_id"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "microplasticsInfo": microplasticsInfo?.toJson(),
        "db_record_id": dbRecordId,
        "user_id": userId,
    };
}

class MicroplasticsInfo {
    String? microplastic;
    String? riskLevel;
    String? score;
    String? description;
    String? healthImpact;
    String? howToImprove;
    String? recommendationTips;

    MicroplasticsInfo({
        this.microplastic,
        this.riskLevel,
        this.score,
        this.description,
        this.healthImpact,
        this.howToImprove,
        this.recommendationTips,
    });

    MicroplasticsInfo copyWith({
        String? microplastic,
        String? riskLevel,
        String? score,
        String? description,
        String? healthImpact,
        String? howToImprove,
        String? recommendationTips,
    }) => 
        MicroplasticsInfo(
            microplastic: microplastic ?? this.microplastic,
            riskLevel: riskLevel ?? this.riskLevel,
            score: score ?? this.score,
            description: description ?? this.description,
            healthImpact: healthImpact ?? this.healthImpact,
            howToImprove: howToImprove ?? this.howToImprove,
            recommendationTips: recommendationTips ?? this.recommendationTips,
        );

    factory MicroplasticsInfo.fromRawJson(String str) => MicroplasticsInfo.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory MicroplasticsInfo.fromJson(Map<String, dynamic> json) => MicroplasticsInfo(
        microplastic: json["microplastic"],
        riskLevel: json["risk_level"],
        score: json["score"],
        description: json["description"],
        healthImpact: json["health_impact"],
        howToImprove: json["how_to_improve"],
        recommendationTips: json["recommendation_tips"],
    );

    Map<String, dynamic> toJson() => {
        "microplastic": microplastic,
        "risk_level": riskLevel,
        "score": score,
        "description": description,
        "health_impact": healthImpact,
        "how_to_improve": howToImprove,
        "recommendation_tips": recommendationTips,
    };
}
