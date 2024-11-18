import 'package:dio/dio.dart';
import 'package:ecommerce_app/payment/models/ephemeral_key_model/ephemeral_key.dart';
import 'package:ecommerce_app/payment/models/init_payment_sheet_input_model.dart';
import 'package:ecommerce_app/payment/models/payment_intent_input_model.dart';
import 'package:ecommerce_app/payment/models/payment_intent_model/payment_intent_model.dart';
import 'package:ecommerce_app/payment/services/api_keys.dart';
import 'package:ecommerce_app/payment/services/api_service.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  final ApiService apiService = ApiService();
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiService.post(
      body: paymentIntentInputModel.toJson(),
      contentType: Headers.formUrlEncodedContentType,
      url: 'https://api.stripe.com/v1/payment_intents',
      token: ApiKeys.secretKey,
    );

    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);

    return paymentIntentModel;
  }

  Future initPaymentSheet(
      {required InitiPaymentSheetInputModel paymentSheetInputModel}) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
      paymentIntentClientSecret: paymentSheetInputModel.clientSecret,
      customerEphemeralKeySecret: paymentSheetInputModel.ephemeralKeySecret,
      customerId: paymentSheetInputModel.customerId,
      merchantDisplayName: 'Doaa',
    ));
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    var ephemeralKeyModel = await createEphemeralKey(
        customerId: paymentIntentInputModel.customerId);
    var initiPaymentSheetIntentModel = InitiPaymentSheetInputModel(
        customerId: paymentIntentInputModel.customerId,
        clientSecret: paymentIntentModel.clientSecret!,
        ephemeralKeySecret: ephemeralKeyModel.secret!);
    await initPaymentSheet(
      paymentSheetInputModel: initiPaymentSheetIntentModel,
    );
    await displayPaymentSheet();
  }

  Future<PaymentIntentModel> createCustomer(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiService.post(
      body: paymentIntentInputModel.toJson(),
      contentType: Headers.formUrlEncodedContentType,
      url: 'https://api.stripe.com/v1/customers',
      token: ApiKeys.secretKey,
    );

    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);

    return paymentIntentModel;
  }

  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerId}) async {
    var response = await apiService.post(
        body: {'customer': customerId},
        contentType: Headers.formUrlEncodedContentType,
        url: 'https://api.stripe.com/v1/ephemeral_keys',
        token: ApiKeys.secretKey,
        headers: {
          'Authorization': "Bearer ${ApiKeys.secretKey}",
          'Stripe-Version': "2024-10-28.acacia",
        });

    var ephemeralKey = EphemeralKeyModel.fromJson(response.data);

    return ephemeralKey;
  }
}
