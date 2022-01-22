import 'dart:convert';

ChoiceModel choiceModelFromJson(String str) =>
    ChoiceModel.fromJson(json.decode(str));

String choiceModelToJson(ChoiceModel data) => json.encode(data.toJson());

class ChoiceModel {
  ChoiceModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  int count;
  dynamic next;
  dynamic previous;
  List<ChoiceResult> results;

  factory ChoiceModel.fromJson(Map<String, dynamic> json) => ChoiceModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<ChoiceResult>.from(
            json["results"].map((x) => ChoiceResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
      };
}

class ChoiceResult {
  ChoiceResult({
    required this.id,
    required this.title,
    required this.body,
    required this.image,
    required this.createdAt,
  });

  int id;
  String title;
  String body;
  String image;
  DateTime createdAt;

  factory ChoiceResult.fromJson(Map<String, dynamic> json) => ChoiceResult(
        id: json["id"] ?? 0,
        title: json["title"] ?? "",
        body: json["body"] ?? "",
        image: json["image"] ?? "",
        createdAt: json["created_at"] == null
            ? DateTime.now()
            : DateTime.parse(json["created_at"]),
      );
}
