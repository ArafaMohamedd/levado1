class NotificationsOrderModel {
  final int id;
  final bool seen;
  final String date;
  final User user;
  final Vendor? vendor;
  final OrderDetail order;
  final OrderItem orderItem;

  NotificationsOrderModel({
    required this.id,
    required this.seen,
    required this.date,
    required this.user,
    required this.vendor,
    required this.order,
    required this.orderItem,
  });

  factory NotificationsOrderModel.fromJson(Map<String, dynamic> json) {
    return NotificationsOrderModel(
      id: json['id'] ?? 0,
      seen: json['seen'] ?? false,
      date: json['date'] ?? '',
      user: json['user'] != null ? User.fromJson(json['user']) : User(id: 0, username: '', email: '', fullName: '', phone: ''),
      vendor: json['vendor'] != null && json['vendor'] is Map<String, dynamic> ? Vendor.fromJson(json['vendor']) : null,
      order: json['order'] != null ? OrderDetail.fromJson(json['order']) : OrderDetail(id: 0, subTotal: '', shippingAmount: '', taxFee: '', serviceFee: '', total: '', paymentStatus: '', orderStatus: '', fullName: '', email: '', mobile: ''),
      orderItem: json['order_item'] != null ? OrderItem.fromJson(json['order_item']) : OrderItem(id: 0, qty: 0, color: '', size: '', price: '', vendor: Vendor(id: 0, image: '', name: '', userID: 0), order: OrderDetail(id: 0, subTotal: '', shippingAmount: '', taxFee: '', serviceFee: '', total: '', paymentStatus: '', orderStatus: '', fullName: '', email: '', mobile: ''), product: Product(id: 0, title: '', image: '', description: '', price: '', oldPrice: '', shippingAmount: '', stockQty: 0, inStock: false, status: '', featured: false, views: 0, rating: 0, pid: '', slug: '', category: Category(id: 0, title: '', image: '', active: false, slug: ''), brand: Brand(id: 0, title: '', image: '', slug: ''), vendor: Vendor(id: 0, image: '', name: '', userID: 0))),
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
    required  this.username ,
    required   this.email ,
    required   this.fullName,
    required   this.phone ,
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

class Vendor {
  final int id;
  final String image;
  final String name;
  final int userID;  // changed from 'user' to 'userID'

  Vendor({
    required this.id,
    required this.image,
    required this.name,
    required this.userID,
  });

  factory Vendor.fromJson(Map<String, dynamic> json) {
    return Vendor(
      id: json['id'] ?? 0,
      image: json['image'] ?? '',
      name: json['name'] ?? '',
      userID: json['userID'] ?? 0,
    );
  }
}

class OrderDetail {
  final int id;
  final String subTotal;
  final String shippingAmount;
  final String taxFee;
  final String serviceFee;
  final String total;
  final String paymentStatus;
  final String orderStatus;
  final String fullName;
  final String email;
  final String mobile;

  OrderDetail({
    required this.id,
    required this.subTotal ,
    required this.shippingAmount ,
    required  this.taxFee ,
    required   this.serviceFee ,
    required   this.total ,
    required   this.paymentStatus ,
    required   this.orderStatus ,
    required   this.fullName ,
    required   this.email ,
    required   this.mobile ,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) {
    return OrderDetail(
      id: json['id'] ?? 0,
      subTotal: json['sub_total'] ?? '',
      shippingAmount: json['shipping_amount'] ?? '',
      taxFee: json['tax_fee'] ?? '',
      serviceFee: json['service_fee'] ?? '',
      total: json['total'] ?? '',
      paymentStatus: json['payment_status'] ?? '',
      orderStatus: json['order_status'] ?? '',
      fullName: json['full_name'] ?? '',
      email: json['email'] ?? '',
      mobile: json['mobile'] ?? '',
    );
  }
}

class OrderItem {
  final int id;
  final int qty;
  final String color;
  final String size;
  final String price;
  final Vendor vendor;
  final OrderDetail order;
  final Product product;

  OrderItem({
    required this.id,
    required this.qty,
    required   this.color ,
    required this.size  ,
    required this.price  ,
    required this.vendor,
    required this.order,
    required this.product,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
        id: json['id'] ?? 0,
        qty: json['qty'] ?? 0,
        color: json['color'] ?? '',
        size: json['size'] ?? '',
        price: json['price'] ?? '',
        vendor: json['vendor'] != null ? Vendor.fromJson(json['vendor']) : Vendor(id: 0, image: '', name: '', userID:0  ),
        order: json['order'] != null ? OrderDetail.fromJson(json['order']) : OrderDetail(id: 0, subTotal: '', shippingAmount: '', taxFee: '', serviceFee: '', total: '', paymentStatus: '', orderStatus: '', fullName: '', email: '', mobile: ''),
        product: json['product'] != null ? Product.fromJson(json['product']) : Product(id: 0, title: '', image: '', description: '', price: '', oldPrice: '', shippingAmount: '', stockQty: 0, inStock: false, status: '', featured: false, views: 0, rating: 0, pid: '', slug: '', category: Category(id: 0, title: '', image: '', active: false, slug: ''), brand: Brand(id: 0, title: '', image: '', slug: ''), vendor: Vendor(id: 0, image: '', name: '', userID:  0))
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
  final Category category;
  final Brand brand;
  final Vendor vendor;

  Product({
    required this.id,
    required this.title,
    required this.image ,
    required  this.description ,
    required  this.price ,
    required  this.oldPrice ,
    required   this.shippingAmount ,
    required this.stockQty,
    required   this.inStock ,
    required  this.status ,
    required  this.featured ,
    required  this.views ,
    required  this.rating ,
    required   this.pid ,
    required   this.slug ,
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
        price: json['price'] ?? '',
        oldPrice: json['old_price'] ?? '',
        shippingAmount: json['shipping_amount'] ?? '',
        stockQty: json['stock_qty'] ?? 0,
        inStock: json['in_stock'] ?? false,
        status: json['status'] ?? '',
        featured: json['featured'] ?? false,
        views: json['views'] ?? 0,
        rating: json['rating'] ?? 0,
        pid: json['pid'] ?? '',
        slug: json['slug'] ?? '',
        category: json['category'] != null ? Category.fromJson(json['category']) : Category(id: 0, title: '', image: '', active: false, slug: ''),
        brand: json['brand'] != null ? Brand.fromJson(json['brand']) : Brand(id: 0, title: '', image: '', slug: ''),
        vendor: json['vendor'] != null ? Vendor.fromJson(json['vendor']) : Vendor(id: 0, image: '', name: '', userID: 0),
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
    required this.image  ,
    required this.active,
    required this.slug  ,
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
    required this.image ,
    required this.slug ,
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
