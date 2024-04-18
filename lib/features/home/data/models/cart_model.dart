class CartItemModel {
  final int id;
  final Product product;
  final int qty;
  final String price;
  final String subTotal;
  final String shippingAmount;
  final String serviceFee;
  final String taxFee;
  final String total;
  final String country;
  final String size;
  final String color;
  final String cartId;
  final String date;
  final int user;

  CartItemModel({
    required this.id,
    required this.product,
    required this.qty,
    required this.price,
    required this.subTotal,
    required this.shippingAmount,
    required this.serviceFee,
    required this.taxFee,
    required this.total,
    required this.country,
    required this.size,
    required this.color,
    required this.cartId,
    required this.date,
    required this.user,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      id: json['id'] ?? 0,
      product: Product.fromJson(json['product'] ?? {}),
      qty: json['qty'] ?? 0,
      price: json['price'] ?? '0.00',
      subTotal: json['sub_total'] ?? '0.00',
      shippingAmount: json['shipping_amount'] ?? '0.00',
      serviceFee: json['service_fee'] ?? '0.00',
      taxFee: json['tax_fee'] ?? '0.00',
      total: json['total'] ?? '0.00',
      country: json['country'] ?? '',
      size: json['size'] ?? '',
      color: json['color'] ?? '',
      cartId: json['cart_id'] ?? '',
      date: json['date'] ?? '',
      user: json['user'] ?? 0,
    );
  }
}

class Product {
  final int id;
  final String title;
  final String image;
  final String price;
  final int views;
  final int rating;
  final String category;
  final String brand;
  final double productRating;
  final int ratingCount;
  final String slug;

  Product({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.views,
    required this.rating,
    required this.category,
    required this.brand,
    required this.productRating,
    required this.ratingCount,
    required this.slug,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      image: json['image'] ?? '',
      price: json['price'] ?? '0.00',
      views: json['views'] ?? 0,
      rating: json['rating'] ?? 0,
      category: json['category'] ?? '',
      brand: json['brand'] ?? '',
      productRating: json['product_rating'] ?? 0.0,
      ratingCount: json['rating_count'] ?? 0,
      slug: json['slug'] ?? '',
    );
  }
}
