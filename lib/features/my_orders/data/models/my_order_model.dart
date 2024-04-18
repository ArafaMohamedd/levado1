class OrdersModel {
  final int id;
  final List<OrderItem> orderItems;
  final double subTotal;
  final double shippingAmount;
  final double taxFee;
  final double serviceFee;
  final double total;
  final String paymentStatus;
  final String orderStatus;
  final double initialTotal;
  final double saved;
  final String fullName;
  final String email;
  final String mobile;
  final String address;
  final String city;
  final String state;
  final String country;
  final String stripeSessionId;
  final String cartOrderId;
  final String oid;
  final String date;
  final Buyer buyer;
  final List<Vendor> vendors;

  OrdersModel({
    required this.id,
    required this.orderItems,
    required this.subTotal,
    required this.shippingAmount,
    required this.taxFee,
    required this.serviceFee,
    required this.total,
    required this.paymentStatus,
    required this.orderStatus,
    required this.initialTotal,
    required this.saved,
    required this.fullName,
    required this.email,
    required this.mobile,
    required this.address,
    required this.city,
    required this.state,
    required this.country,
    required this.stripeSessionId,
    required this.cartOrderId,
    required this.oid,
    required this.date,
    required this.buyer,
    required this.vendors,
  });

  factory OrdersModel.fromJson(Map<String, dynamic> json) {
    return OrdersModel(
      id: json['id'] ?? 0,
      orderItems: (json['orderitem'] as List<dynamic>?)
          ?.map((item) => OrderItem.fromJson(item))
          ?.toList() ?? [],
      subTotal: double.parse(json['sub_total'] ?? '0'),
      shippingAmount: double.parse(json['shipping_amount'] ?? '0'),
      taxFee: double.parse(json['tax_fee'] ?? '0'),
      serviceFee: double.parse(json['service_fee'] ?? '0'),
      total: double.parse(json['total'] ?? '0'),
      paymentStatus: json['payment_status'] ?? '',
      orderStatus: json['order_status'] ?? '',
      initialTotal: double.parse(json['initial_total'] ?? '0'),
      saved: double.parse(json['saved'] ?? '0'),
      fullName: json['full_name'] ?? '',
      email: json['email'] ?? '',
      mobile: json['mobile'] ?? '',
      address: json['address'] ?? '',
      city: json['city'] ?? '',
      state: json['state'] ?? '',
      country: json['country'] ?? '',
      stripeSessionId: json['stripe_session_id'] ?? '',
      cartOrderId: json['cart_order_id'] ?? '',
      oid: json['oid'] ?? '',
      date: json['date'] ?? '',
      buyer: Buyer.fromJson(json['buyer'] ?? {}),
      vendors: (json['vendor'] as List<dynamic>?)
          ?.map((vendor) => Vendor.fromJson(vendor))
          ?.toList() ?? [],
    );
  }
}

class OrderItem {
  final int id;
  final int qty;
  final String color;
  final String size;
  final double price;
  final String country;
  final double subTotal;
  final double shippingAmount;
  final double taxFee;
  final double serviceFee;
  final double total;
  final double initialTotal;
  final double saved;
  final String oid;
  final String date;
  final Vendor vendor;
  final OrdersModel order;
  final Product product;
  final List<dynamic> coupon;

  OrderItem({
    required this.id,
    required this.qty,
    required this.color,
    required this.size,
    required this.price,
    required this.country,
    required this.subTotal,
    required this.shippingAmount,
    required this.taxFee,
    required this.serviceFee,
    required this.total,
    required this.initialTotal,
    required this.saved,
    required this.oid,
    required this.date,
    required this.vendor,
    required this.order,
    required this.product,
    required this.coupon,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      id: json['id'] ?? 0,
      qty: json['qty'] ?? 0,
      color: json['color'] ?? '',
      size: json['size'] ?? '',
      price: double.parse(json['price'] ?? '0'),
      country: json['country'] ?? '',
      subTotal: double.parse(json['sub_total'] ?? '0'),
      shippingAmount: double.parse(json['shipping_amount'] ?? '0'),
      taxFee: double.parse(json['tax_fee'] ?? '0'),
      serviceFee: double.parse(json['service_fee'] ?? '0'),
      total: double.parse(json['total'] ?? '0'),
      initialTotal: double.parse(json['initial_total'] ?? '0'),
      saved: double.parse(json['saved'] ?? '0'),
      oid: json['oid'] ?? '',
      date: json['date'] ?? '',
      vendor: Vendor.fromJson(json['vendor'] ?? {}),
      order: OrdersModel.fromJson(json['order'] ?? {}),
      product: Product.fromJson(json['product'] ?? {}),
      coupon: json['coupon'] ?? [],
    );
  }
}

class Buyer {
  final int id;
  final String fullName;
  final String email;
  final String phone;

  Buyer({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
  });

  factory Buyer.fromJson(Map<String, dynamic> json) {
    return Buyer(
      id: json['id'] ?? 0,
      fullName: json['full_name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
    );
  }
}

class Vendor {
  final int id;
  final String image;
  final String name;
  final String description;
  final String mobile;
  final bool activate;
  final String date;
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
      image: json['image'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      mobile: json['mobile'] ?? '',
      activate: json['activate'] ?? false,
      date: json['date'] ?? '',
      slug: json['slug'] ?? '',
      user: User.fromJson(json['user'] ?? {}),
    );
  }
}

class User {
  final int id;
  final String username;
  final String email;
  final String fullName;
  final String phone;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.fullName,
    required this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0,
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      fullName: json['full_name'] ?? '',
      phone: json['phone'] ?? '',
    );
  }
}

class Product {
  final int id;
  final String title;
  final String image;
  final String description;
  final double price;
  final double oldPrice;
  final double shippingAmount;
  final int stockQty;
  final bool inStock;
  final String status;
  final bool featured;
  final int views;
  final int rating;
  final String pid;
  final String slug;
  final String date;
  final Category category;
  final Brand brand;
  final Vendor vendor;

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
    required this.date,
    required this.category,
    required this.brand,
    required this.vendor,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      image: json['image'] ?? '',
      description: json['description'] ?? '',
      price: double.parse(json['price'] ?? '0'),
      oldPrice: double.parse(json['old_price'] ?? '0'),
      shippingAmount: double.parse(json['shipping_amount'] ?? '0'),
      stockQty: json['stock_qty'] ?? 0,
      inStock: json['in_stock'] ?? false,
      status: json['status'] ?? '',
      featured: json['featured'] ?? false,
      views: json['views'] ?? 0,
      rating: json['rating'] ?? 0,
      pid: json['pid'] ?? '',
      slug: json['slug'] ?? '',
      date: json['date'] ?? '',
      category: Category.fromJson(json['category'] ?? {}),
      brand: Brand.fromJson(json['brand'] ?? {}),
      vendor: Vendor.fromJson(json['vendor'] ?? {}),
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
      title: json['title'] ?? '',
      image: json['image'] ?? '',
      active: json['active'] ?? false,
      slug: json['slug'] ?? '',
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
      title: json['title'] ?? '',
      image: json['image'] ?? '',
      slug: json['slug'] ?? '',
    );
  }
}
