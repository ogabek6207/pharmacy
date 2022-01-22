

import 'dart:convert';

List<RegionModel> regionModelFromJson(String str) => List<RegionModel>.from(json.decode(str).map((x) => RegionModel.fromJson(x)));



class RegionModel {
  RegionModel({
    required this.id,
    required this.name,
    required this.childs,
    this.isSelected = false,
  });

  int id;
  String name;
  List<RegionModel> childs;
  bool isSelected;

  factory RegionModel.fromJson(Map<String, dynamic> json) => RegionModel(
    id: json["id"] ?? 0,
    name: json["name"] ?? 0,
    childs: List<RegionModel>.from(json["childs"].map((x) => x)),

  );

}
