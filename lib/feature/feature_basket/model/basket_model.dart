import 'package:get/get.dart';

class BasketModel {
  int id;
  int productId;
  String product;
  int count;
  int price;
  int discount;
  int discountPrice;
  String image;
  late RxBool isLoading;
  late RxBool isDeleting; // Renamed isDeleteing to isDeleting for consistency

  BasketModel(this.id, this.productId, this.product, this.count, this.price,
      this.discount, this.discountPrice, this.image,
      {bool isLoading = false, bool isDeleting = false}) {
    this.isLoading = RxBool(isLoading);
    this.isDeleting = RxBool(isDeleting);
  }

  factory BasketModel.fromJson(Map<String, dynamic> json) {
    return BasketModel(
      json["id"],
      json['product_id'],
      json['product'],
      json['count'],
      json['price'],
      json['discount'],
      json['discount_price'],
      json['image'],
    );
  }
}
