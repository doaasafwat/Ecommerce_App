import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/payment/errors/failure.dart';
import 'package:ecommerce_app/payment/models/payment_intent_input_model.dart';
import 'package:ecommerce_app/payment/repo/checkout_repo.dart';
import 'package:ecommerce_app/payment/services/stripe_services.dart';

class CheckoutRepoImp extends CheckoutRepo {
  StripeService stripeService = StripeService();
  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async{
   try {
  await stripeService.makePayment(paymentIntentInputModel: paymentIntentInputModel);
  return right(null);
}  catch (e) {
 return left(ServerFailure(errMessage: e.toString()));
}
  }
}
