class CardDatabaseModel {
  CardDatabaseModel({
    required this.id,
    required this.name,
    required this.image,
    required this.cardCount,
    required this.manufacturer,
    required this.price,
    required this.basePrice,
    this.isFav = false,
  });

  int id;
  int cardCount;
  String name;
  String image;
  String manufacturer;
  double price;
  double basePrice;
  bool isFav;

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "card_count": cardCount,
        "manufacturer": manufacturer,
        "price": price,
        "base_price": basePrice,
      };
}
