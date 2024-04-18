class PersonalInformationResponseModel {
  final String message;
  final String orderOid;

  PersonalInformationResponseModel({required this.message, required this.orderOid});

  factory PersonalInformationResponseModel.fromJson(Map<String, dynamic> json) {
    return PersonalInformationResponseModel(
      message: json['message'] ?? '',
      orderOid: json['order_oid'] ?? '',
    );
  }


}
