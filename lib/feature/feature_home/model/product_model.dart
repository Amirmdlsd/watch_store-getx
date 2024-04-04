class ProductModel {
  int? id;
  String? title;
  int? price;
  int? discount;
  String? specialExpiration;
  int? discountPrice;
  int? productCount;
  String? category;
  String? brand;
  String? image;
  String? discussion;


  ProductModel(
      this.id,
      this.title,
      this.price,
      this.discount,
      this.specialExpiration,
      this.discountPrice,
      this.productCount,
      this.category,
      this.brand,
      this.image,
      {this.discussion,
     });

  factory ProductModel.fromMapJson(Map<String, dynamic> json) {
    return ProductModel(
        json["id"],
        json["title"],
        json["price"],
        json["discount"],
        json["special_expiration"],
        json["discount_price"],
        json["product_count"],
        json["category"],
        json["brand"],
        json["image"],
        discussion: json['discussion'] ?? "",
     );
  }
}

class ProductPropertiesModel {
  String property;
  String value;

  ProductPropertiesModel(this.property, this.value);

  factory ProductPropertiesModel.fromJson(Map<String, dynamic> json) {
    return ProductPropertiesModel(
        json['property'], json['value']);
  }
}
