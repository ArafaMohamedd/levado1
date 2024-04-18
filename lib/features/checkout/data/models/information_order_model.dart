class InformationOrder {
  int id;
  String subTotal;
  String shippingAmount;
  String taxFee;
  String serviceFee;
  String total;
  String paymentStatus;
  String orderStatus;
  String initialTotal;
  String saved;
  String fullName;
  String email;
  String mobile;
  String address;
  String city;
  String state;
  String country;
  String stripeSessionId;
  String oid;
  String date;
  Buyer? buyer;
  List<dynamic>? vendor;

  InformationOrder({
    required   this.id,
    required   this.subTotal,
    required    this.shippingAmount,
    required    this.taxFee,
    required    this.serviceFee,
    required    this.total,
    required    this.paymentStatus,
    required    this.orderStatus,
    required    this.initialTotal,
    required    this.saved,
    required    this.fullName,
    required    this.email,
    required    this.mobile,
    required    this.address,
    required    this.city,
    required    this.state,
    required    this.country,
    required    this.stripeSessionId,
    required    this.oid,
    required    this.date,
    required   this.buyer,
    required    this.vendor,
  });

  factory InformationOrder.fromJson(Map<String, dynamic> json) {
    return InformationOrder(
      id: json['id'] ?? 0,
      subTotal: json['sub_total'] ?? "0.00",
      shippingAmount: json['shipping_amount'] ?? "0.00",
      taxFee: json['tax_fee'] ?? "0.00",
      serviceFee: json['service_fee'] ?? "0.00",
      total: json['total'] ?? "0.00",
      paymentStatus: json['payment_status'] ?? "",
      orderStatus: json['order_status'] ?? "",
      initialTotal: json['initial_total'] ?? "0.00",
      saved: json['saved'] ?? "0.00",
      fullName: json['full_name'] ?? "",
      email: json['email'] ?? "",
      mobile: json['mobile'] ?? "",
      address: json['address'] ?? "",
      city: json['city'] ?? "",
      state: json['state'] ?? "",
      country: json['country'] ?? "",
      stripeSessionId: json['stripe_session_id']?? "",
      oid: json['oid'] ?? "",
      date: json['date'] ?? "",
      buyer: json['buyer'] != null ? Buyer.fromJson(json['buyer']) : null,
      vendor: json['vendor'] ?? [],
    );
  }
}

class Buyer {
  int id;
  String password;
  String lastLogin;
  bool isSuperuser;
  String firstName;
  String lastName;
  bool isStaff;
  bool isActive;
  String dateJoined;
  String username;
  String email;
  String fullName;
  dynamic phone;
  dynamic otp;
  List<dynamic> groups;
  List<dynamic> userPermissions;

  Buyer({
    required this.id,
    required this.password,
    required   this.lastLogin,
    required   this.isSuperuser,
    required    this.firstName,
    required    this.lastName,
    required    this.isStaff,
    required    this.isActive,
    required    this.dateJoined,
    required    this.username,
    required    this.email,
    required    this.fullName,
    required    this.phone,
    required this.otp,
    required  this.groups,
    required  this.userPermissions,
  });

  factory Buyer.fromJson(Map<String, dynamic> json) {
    return Buyer(
      id: json['id'] ?? 0,
      password: json['password'] ?? "",
      lastLogin: json['last_login'] ?? "",
      isSuperuser: json['is_superuser'] ?? false,
      firstName: json['first_name'] ?? "",
      lastName: json['last_name'] ?? "",
      isStaff: json['is_staff'] ?? false,
      isActive: json['is_active'] ?? false,
      dateJoined: json['date_joined'] ?? "",
      username: json['username'] ?? "",
      email: json['email'] ?? "",
      fullName: json['full_name'] ?? "",
      phone: json['phone'],
      otp: json['otp'],
      groups: json['groups'] ?? [],
      userPermissions: json['user_permissions'] ?? [],
    );
  }
}
