class ItemModel {
  String image;
  String name;
  String manifacturer;
  int price;
  bool favSelected;
  int cardCount;
  int basePrice;

  ItemModel({
    required this.image,
    required this.name,
    required this.manifacturer,
    required this.price,
    this.favSelected = false,
    this.cardCount = 0,
    this.basePrice = 0,
  });
}
