class CategoryModel {
  int id;
  String title;
  String image;

  CategoryModel(this.id, this.title, this.image);

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(json['id'], json['title'], json['image']);
  }
}
