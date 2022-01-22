class CategoryModel {
  CategoryModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  int count;
  String next;
  String previous;
  List<CategoryResult> results;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        count: json["count"] ?? 0,
        next: json["next"] ?? "",
        previous: json["previous"] ?? "",
        results: List<CategoryResult>.from(
            json["results"].map((x) => CategoryResult.fromJson(x))),
      );
}

class CategoryResult {
  CategoryResult({
    required this.id,
    required this.name,
    required this.image,
    required this.slug,
    required this.childs,
  });

  int id;
  String name;
  String image;
  String slug;
  List<CategoryResult> childs;

  factory CategoryResult.fromJson(Map<String, dynamic> json) => CategoryResult(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        image: json["image"] ?? "",
        slug: json["slug"] ?? "",
        childs: List<CategoryResult>.from(
            json["childs"].map((x) => CategoryResult.fromJson(x))),
      );
}
