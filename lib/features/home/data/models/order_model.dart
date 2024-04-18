class OrderModel {
  final double shipping;
  final double tax;
  final double serviceFee;
  final double subTotal;
  final double total;

  OrderModel({
    required this.shipping,
    required this.tax,
    required this.serviceFee,
    required this.subTotal,
    required this.total,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      shipping: json['shipping'] ?? 0.0,
      tax: json['tax'] ?? 0.0,
      serviceFee: json['service_fee'] ?? 0.0,
      subTotal: json['sub_total'] ?? 0.0,
      total: json['total'] ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'shipping': shipping,
      'tax': tax,
      'service_fee': serviceFee,
      'sub_total': subTotal,
      'total': total,
    };
  }
}
