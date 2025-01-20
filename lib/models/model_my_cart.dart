class MyCartModel {
  String productName;
  String discount;
  double price;
  double totalPrice;
  String category;
  String image;
  int quantity;

  MyCartModel({
    required this.productName,
    required this.discount,
    required this.price,
    required this.category,
    required this.totalPrice,
    required this.quantity,
    required this.image,
  });
}
