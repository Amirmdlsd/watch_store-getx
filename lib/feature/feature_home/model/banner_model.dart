class BrandModel {
  int id;
  String title;
  String image;

  BrandModel(this.id, this.title, this.image);
  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      json['id'],
      json['title'],
      json['image']
    );
  }
}
