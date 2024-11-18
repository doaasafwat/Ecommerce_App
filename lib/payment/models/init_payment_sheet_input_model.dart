class InitiPaymentSheetInputModel {
  final String clientSecret;
  final customerId;
  final String ephemeralKeySecret;

  InitiPaymentSheetInputModel({required this.customerId, 
      required this.clientSecret, required this.ephemeralKeySecret});
}
