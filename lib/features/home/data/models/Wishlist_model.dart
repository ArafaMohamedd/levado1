class WishlistModel {
  final String message;
  final List<int> wishlist;
  final List<WishlistItem>? data;

  WishlistModel({
    required this.message,
    required this.wishlist,
    this.data,
  });

  factory WishlistModel.fromJson(Map<String, dynamic> json) {
    return WishlistModel(
      message: json['message'] ?? "",
      wishlist: (json['wishlist'] as List<dynamic>).cast<int>(),
      data: (json['data'] as List<dynamic>?)?.map((item) => WishlistItem.fromJson(item)).toList(),
    );
  }
}

class WishlistItem {
  final int id;
  final String user;
  final String date;
  final Product? product;

  WishlistItem({
    required this.id,
    required this.user,
    required this.date,
    this.product,
  });

  factory WishlistItem.fromJson(Map<String, dynamic> json) {
    return WishlistItem(
      id: json['id'] ?? 0,
      user: json['user'] ?? "",
      date: json['date']?.toString() ?? "",
      product: json['product'] != null ? Product.fromJson(json['product']) : null,
    );
  }
}

class Product {
  final int id;
  final String title;
  final String image;
  final String description;
  final String price;
  final String oldPrice;
  final String shippingAmount;
  final int stockQty;
  final bool inStock;
  final String status;
  final bool featured;
  final int views;
  final int rating;
  final String pid;
  final String slug;
  final Category? category;
  final Brand? brand;
  final Vendor? vendor;

  Product({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
    required this.price,
    required this.oldPrice,
    required this.shippingAmount,
    required this.stockQty,
    required this.inStock,
    required this.status,
    required this.featured,
    required this.views,
    required this.rating,
    required this.pid,
    required this.slug,
    this.category,
    this.brand,
    this.vendor,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      title: json['title'] ?? "",
      image: json['image'] ?? "",
      description: json['description'] ?? "",
      price: json['price'] ?? "",
      oldPrice: json['old_price'] ?? "",
      shippingAmount: json['shipping_amount'] ?? "",
      stockQty: json['stock_qty'] ?? 0,
      inStock: json['in_stock'] ?? false,
      status: json['status'] ?? "",
      featured: json['featured'] ?? false,
      views: json['views'] ?? 0,
      rating: json['rating'] ?? 0,
      pid: json['pid'] ?? "",
      slug: json['slug'] ?? "",
      category: json['category'] != null ? Category.fromJson(json['category']) : null,
      brand: json['brand'] != null ? Brand.fromJson(json['brand']) : null,
      vendor: json['vendor'] != null ? Vendor.fromJson(json['vendor']) : null,
    );
  }
}

class Category {
  final int id;
  final String title;
  final String image;
  final bool active;
  final String slug;

  Category({
    required this.id,
    required this.title,
    required this.image,
    required this.active,
    required this.slug,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] ?? 0,
      title: json['title'] ?? "",
      image: json['image'] ?? "",
      active: json['active'] ?? false,
      slug: json['slug'] ?? "",
    );
  }
}

class Brand {
  final int id;
  final String title;
  final String image;
  final String slug;

  Brand({
    required this.id,
    required this.title,
    required this.image,
    required this.slug,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['id'] ?? 0,
      title: json['title'] ?? "",
      image: json['image'] ?? "",
      slug: json['slug'] ?? "",
    );
  }
}

class Vendor {
  final int id;
  final String image;
  final String name;
  final String description;
  final String? mobile;
  final bool activate;
  final DateTime date;
  final String slug;
  final User user;

  Vendor({
    required this.id,
    required this.image,
    required this.name,
    required this.description,
    required this.mobile,
    required this.activate,
    required this.date,
    required this.slug,
    required this.user,
  });

  factory Vendor.fromJson(Map<String, dynamic> json) {
    return Vendor(
      id: json['id'] ?? 0,
      image: json['image'] ?? "",
      name: json['name'] ?? "",
      description: json['description'] ?? "",
      mobile: json['mobile']?.toString() ?? "",
      activate: json['activate'] ?? false,
      date: DateTime.tryParse(json['date']?.toString() ?? "") ?? DateTime.now(),
      slug: json['slug'] ?? "",
      user: User.fromJson(json['user']),
    );
  }
}

class User {
  final int id;
  final String password;
  final DateTime? lastLogin;
  final bool isSuperuser;
  final String firstName;
  final String lastName;
  final bool isStaff;
  final bool isActive;
  final DateTime dateJoined;
  final String username;
  final String email;
  final String fullName;
  final String phone;
  final String? otp;
  final List<dynamic> groups;
  final List<dynamic> userPermissions;

  User({
    required this.id,
    required this.password,
  required  this.lastLogin,
    required this.isSuperuser,
    required this.firstName,
    required this.lastName,
    required this.isStaff,
    required this.isActive,
    required this.dateJoined,
    required this.username,
    required this.email,
    required this.fullName,
    required this.phone,
    required  this.otp,
    required this.groups,
    required this.userPermissions,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0,
      password: json['password'] ?? "",
      lastLogin: json['last_login'] != null ? DateTime.tryParse(json['last_login'].toString()) : null,  // Handle nullable DateTime
      isSuperuser: json['is_superuser'] ?? false,
      firstName: json['first_name'] ?? "",
      lastName: json['last_name'] ?? "",
      isStaff: json['is_staff'] ?? false,
      isActive: json['is_active'] ?? false,
      dateJoined: DateTime.tryParse(json['date_joined']?.toString() ?? "") ?? DateTime.now(),
      username: json['username'] ?? "",
      email: json['email'] ?? "",
      fullName: json['full_name'] ?? "",
      phone: json['phone']?.toString() ?? "", // Convert to string and provide a default value
      otp: json['otp'] ?? "", // OTP is nullable, so provide a default value
      groups: (json['groups'] as List<dynamic>?) ?? [],
      userPermissions: (json['user_permissions'] as List<dynamic>?) ?? [],
    );
  }
}