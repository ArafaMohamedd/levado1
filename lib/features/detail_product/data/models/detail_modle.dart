class DetailProductModel {
  final int id;
  final String title;
  final String image;
  final String description;
  final String category;
  final String brand;
  final String price;
  final String oldPrice;
  final String shippingAmount;
  final int stockQty;
  final bool inStock;
  final String status;
  final bool featured;
  final int views;
  final dynamic rating;
  final String vendor;
  final String pid;
  final String slug;
  final String date;
  final List<Gallery> gallery;
  final List<Size> size;
  final List<Color> color;
  final dynamic productRating;
  final int ratingCount;

  DetailProductModel({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
    required this.category,
    required this.brand,
    required this.price,
    required this.oldPrice,
    required this.shippingAmount,
    required this.stockQty,
    required this.inStock,
    required this.status,
    required this.featured,
    required this.views,
    required this.rating,
    required this.vendor,
    required this.pid,
    required this.slug,
    required this.date,
    required this.gallery,
    required this.size,
    required this.color,
    required this.productRating,
    required this.ratingCount,
  });

  factory DetailProductModel.fromJson(Map<String, dynamic> json) {
    return DetailProductModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      image: json['image'] ?? '',
      description: json['description'] ?? '',
      category: json['category'] ?? '',
      brand: json['brand'] ?? '',
      price: json['price'] ?? '0.00',
      oldPrice: json['old_price'] ?? '0.00',
      shippingAmount: json['shipping_amount'] ?? '0.00',
      stockQty: json['stock_qty'] ?? 0,
      inStock: json['in_stock'] ?? false,
      status: json['status'] ?? '',
      featured: json['featured'] ?? false,
      views: json['views'] ?? 0,
      rating: json['rating'],
      vendor: json['vendor'] ?? '',
      pid: json['pid'] ?? '',
      slug: json['slug'] ?? '',
      date: json['date'] ?? '',
      gallery: (json['gallery'] as List<dynamic>?)
          ?.map((galleryJson) => Gallery.fromJson(galleryJson))
          .toList() ?? [],
      size: (json['size'] as List<dynamic>?)
          ?.map((sizeJson) => Size.fromJson(sizeJson))
          .toList() ?? [],
      color: (json['color'] as List<dynamic>?)
          ?.map((colorJson) => Color.fromJson(colorJson))
          .toList() ?? [],
      productRating: json['product_rating'],
      ratingCount: json['rating_count'] ?? 0,
    );
  }
}

class Gallery {
  final int id;
  final String image;
  final bool active;
  final String date;
  final String gid;
  final int product;

  Gallery({
    required this.id,
    required this.image,
    required this.active,
    required this.date,
    required this.gid,
    required this.product,
  });

  factory Gallery.fromJson(Map<String, dynamic> json) {
    return Gallery(
      id: json['id'] ?? 0,
      image: json['image'] ?? '',
      active: json['active'] ?? false,
      date: json['date'] ?? '',
      gid: json['gid'] ?? '',
      product: json['product'] ?? 0,
    );
  }
}

class Size {
  final int id;
  final String name;
  final String price;
  final String date;
  final int product;

  Size({
    required this.id,
    required this.name,
    required this.price,
    required this.date,
    required this.product,
  });

  factory Size.fromJson(Map<String, dynamic> json) {
    return Size(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      price: json['price'] ?? '0.00',
      date: json['date'] ?? '',
      product: json['product'] ?? 0,
    );
  }
}

class Color {
  final int id;
  final String name;
  final String colorCode;
  final int product;

  Color({
    required this.id,
    required this.name,
    required this.colorCode,
    required this.product,
  });

  factory Color.fromJson(Map<String, dynamic> json) {
    return Color(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      colorCode: json['color_code'] ?? '',
      product: json['product'] ?? 0,
    );
  }
}
