class TotalPriceModel {
  int? cartTotalPrice;
  int? totalWithoutDiscountPrice;

  TotalPriceModel(this.cartTotalPrice, this.totalWithoutDiscountPrice);

  factory TotalPriceModel.fromJson(Map<String,dynamic>json){
    return TotalPriceModel(
      json['cart_total_price'],
      json['total_without_discount_price'],
    );
  }
}