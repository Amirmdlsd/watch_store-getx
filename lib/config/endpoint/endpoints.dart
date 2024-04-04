class EndPoints {
  static const String mainEndPoint = "https://watchstore.sasansafari.com/";
  static const String sendSmsEndPoint ='${EndPoints.mainEndPoint}public/api/v1/send_sms';
  static const String checkSmsEndPoint ='${EndPoints.mainEndPoint}public/api/v1/check_sms_code';
  static const String registerEndPoint ='${EndPoints.mainEndPoint}public/api/v1/register';
  static const String homeEndPoint = "${EndPoints.mainEndPoint}public/api/v1/home";
  static const String productDetailEndPoint = "${EndPoints.mainEndPoint}public/api/v1/product_details/";
  static const String addToBasketasketEndPoint = "${EndPoints.mainEndPoint}public/api/v1/add_to_cart";
  static const String basketasketEndPoint = "${EndPoints.mainEndPoint}public/api/v1/user_cart";
  static const String basketasketRemoveEndPoint = "${EndPoints.mainEndPoint}public/api/v1/remove_from_cart";
  static const String basketasketDeleteEndPoint = "${EndPoints.mainEndPoint}public/api/v1/delete_from_cart";
  static const String basketasketTotalPriceEndPoint = "${EndPoints.mainEndPoint}public/api/v1/total_cart_price";
  static const String productByCategoryIdEndPoint = "${EndPoints.mainEndPoint}public/api/v1/products_by_category/";
  static const String productByBrandIdEndPoint = "${EndPoints.mainEndPoint}public/api/v1/products_by_brand/";
  static const String brandEndPoint = "${EndPoints.mainEndPoint}public/api/v1/brands";
  static const String profileEndPoint = "${EndPoints.mainEndPoint}public/api/v1/profile";
  static const String sendCommentEndPoint = "${EndPoints.mainEndPoint}public/api/v1/save_product_comment";
  static const String newestProducttEndPoint = "${EndPoints.mainEndPoint}public/api/v1/newest_products";
  static const String cheapestProductEndPoint = "${EndPoints.mainEndPoint}public/api/v1/newest_products";
  static const String mostExpensiveProductEndPoint = "${EndPoints.mainEndPoint}public/api/v1/most_expensive_products";
  static const String mostViewedProductEndPoint = "${EndPoints.mainEndPoint}public/api/v1/most_viewed_products";
}
