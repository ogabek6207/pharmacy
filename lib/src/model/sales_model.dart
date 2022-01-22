

import 'dart:convert';

SalesModel salesModelFromJson(String str) => SalesModel.fromJson(json.decode(str));



class SalesModel {
  SalesModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  int count;
  dynamic next;
  dynamic previous;
  List<SalesResult> results;

  factory SalesModel.fromJson(Map<String, dynamic> json) => SalesModel(
    count: json["count"],
    next: json["next"],
    previous: json["previous"],
    results: List<SalesResult>.from(json["results"].map((x) => SalesResult.fromJson(x))),
  );


}

class SalesResult {
  SalesResult({

    required this.image,

  });


  String image;


  factory SalesResult.fromJson(Map<String, dynamic> json) => SalesResult(

    image: json["image"] ?? "",

  );


}
