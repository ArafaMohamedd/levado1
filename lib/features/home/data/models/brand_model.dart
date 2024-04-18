class BrandModel {
  final int id;
  final String title;
  final String image;
  final String slug;

  BrandModel({
    required this.id,
    required this.title,
    required this.image,
    required this.slug,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      image: json['image'] ?? '',
      slug: json['slug'] ?? '',
    );
  }
}
