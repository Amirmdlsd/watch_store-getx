class BannerModel {
  int id;
  String title;
  String image;

  BannerModel(this.id, this.title, this.image);
  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      json['id'],
      json['title'],
      json['image']
    );
  }
}
