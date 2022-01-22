import 'dart:convert';

List<StoryModel> storyModelFromJson(String str) =>
    List<StoryModel>.from(json.decode(str).map((x) => StoryModel.fromJson(x)));

class StoryModel {
  StoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.address,
    required this.phone,
    required this.mode,
    this.faveSelected = false,
  });

  int id;
  String name;
  String image;
  String address;
  String phone;
  String mode;
  bool faveSelected;
  factory StoryModel.fromJson(Map<String, dynamic> json) => StoryModel(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        image: json["image"] ?? "",
        address: json["address"] ?? "",
        phone: json["phone"] ?? "",
        mode: json["mode"] ?? "",
      );
}
