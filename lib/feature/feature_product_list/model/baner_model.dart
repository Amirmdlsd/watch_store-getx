class BannerModel {
  final int id;
  final String title;
  final String image;

  BannerModel(this.id, this.title, this.image);

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(json['id'], json['title'], json['image']);
  }
}
