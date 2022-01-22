class FavDatabaseModel {
  FavDatabaseModel({
    required this.id,
    required this.name,
    required this.image,
    required this.manufacturer,
    required this.price,
    required this.basePrice,
  });

  int id;

  String name;
  String image;
  String manufacturer;
  double price;
  double basePrice;

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "manufacturer": manufacturer,
        "price": price,
        "base_price": basePrice,
      };
}
