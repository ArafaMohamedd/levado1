class ProductModel {
  final int id;
  final String title;
  final String image;
  final double price;
  final int views;
  final int? rating;
  final String category;
  final String brand;
  final double? productRating;
  final int ratingCount;
  final String slug;

  ProductModel({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.views,
    this.rating,
    required this.category,
    required this.brand,
    this.productRating,
    required this.ratingCount,
    required this.slug,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? "",
      image: json['image'] ?? "",
      price: double.tryParse(json['price'].toString()) ?? 0.0,
      views: json['views'] ?? 0,
      rating: json['rating'],
      category: json['category'] ?? "",
      brand: json['brand'] ?? "",
      productRating: json['product_rating']??0.0,
      ratingCount: json['rating_count'] ?? 0,
      slug: json['slug'] ?? "",
    );
  }
}
