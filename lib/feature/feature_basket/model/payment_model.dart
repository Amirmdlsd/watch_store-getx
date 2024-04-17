class PaymentModel {
  int cartTotalPrice;
  int totalWithoutDiscountPrice;

  PaymentModel(this.cartTotalPrice, this.totalWithoutDiscountPrice);

  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(
        json['cart_total_price'], json['total_without_discount_price']);
  }
}
