class TypeCategoryModel {
  final int id;
  final String title;
  final String image;
  final bool active;
  final String slug;

  TypeCategoryModel({
    required this.id,
    required this.title,
    required this.image,
    required this.active,
    required this.slug,
  });

  factory TypeCategoryModel.fromJson(Map<String, dynamic> json) {
    return TypeCategoryModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      image: json['image'] ?? '',
      active: json['active'] ?? false,
      slug: json['slug'] ?? '',
    );
  }
}
