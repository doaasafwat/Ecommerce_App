class InitiPaymentSheetInputModel {
  final String clientSecret;

  final String ephemeralKeySecret;

  InitiPaymentSheetInputModel(
      {required this.clientSecret,

      required this.ephemeralKeySecret});
}