

import 'package:ecommerce_app/payment/errors/failure.dart';
import 'package:ecommerce_app/payment/models/payment_intent_input_model.dart';
import 'package:dartz/dartz.dart';
abstract class CheckoutRepo {
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel});
}