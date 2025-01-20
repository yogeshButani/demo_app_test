class ProductsModel {
  String price;
  double rating;
  String productName;
  String discount;
  String productStatus;
  bool addedToCart;
  String productDescription;
  String image;

  ProductsModel({
    required this.price,
    required this.rating,
    required this.productName,
    required this.discount,
    required this.addedToCart,
    required this.productDescription,
    required this.productStatus,
    required this.image,
  });
}
