import 'package:ecommerce_app/payment/cubit/payment_cubit.dart';
import 'package:ecommerce_app/payment/cubit/payment_state.dart';
import 'package:ecommerce_app/payment/models/amount_model/amount_model.dart';
import 'package:ecommerce_app/payment/models/amount_model/details.dart';
import 'package:ecommerce_app/payment/models/item_list_model/item.dart';
import 'package:ecommerce_app/payment/models/payment_intent_input_model.dart';
import 'package:ecommerce_app/payment/services/api_keys.dart';
import 'package:ecommerce_app/payment/views/thank_you_view.dart';
import 'package:ecommerce_app/provider/cart_provider.dart';
import 'package:ecommerce_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:provider/provider.dart';

class CustomButtonBlocCunsumer extends StatelessWidget {
  const CustomButtonBlocCunsumer({
    super.key,
    required this.isPaypal,
  });
  final bool isPaypal;
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const ThankYouView();
              },
            ),
          );
        } else if (state is PaymentFailure) {
          Navigator.pop(context);
          SnackBar snackBar = SnackBar(content: Text(state.errMessage));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return CustomButton(
            isLoading: state is PaymentLoading ? true : false,
            text: 'Continue',
            onPressed: () {
              if (isPaypal) {
                List<OrderItemModel> items = [
                  OrderItemModel(
                    currency: 'USD',
                    name: 'Apple',
                    price: '${(cartProvider.totalPrice).toInt()}',
                    quantity: 1,
                  ),
                ];

                double subtotal = items.fold(0.0, (sum, item) {
                  return sum + (double.parse(item.price!) * item.quantity!);
                });

                var amount = AmountModel(
                  currency: 'USD',
                  details: Details(
                    shipping: '0',
                    shippingDiscount: 0,
                    subtotal: subtotal.toStringAsFixed(2),
                  ),
                  total: (subtotal).toStringAsFixed(2),
                );

                var transactions = [
                  {
                    "amount": amount.toJson(),
                    "description": "The payment transaction description.",
                    "item_list": {
                      "items": items.map((item) => item.toJson()).toList(),
                    },
                  }
                ];

                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => PaypalCheckoutView(
                    sandboxMode: true,
                    clientId: ApiKeys.clientId,
                    secretKey: ApiKeys.paypalSecretKey,
                    transactions: transactions,
                    note: "Contact us for any questions on your order.",
                    onSuccess: (Map params) async {
                     
                      Navigator.pop(context);
                    },
                    onError: (error) {
                    
                      Navigator.pop(context);
                    },
                    onCancel: () {
                   
                      Navigator.pop(context);
                    },
                  ),
                ));
              } else {
                PaymentIntentInputModel paymentIntentInputModel =
                    PaymentIntentInputModel(
                  amount: '${(cartProvider.totalPrice * 100).toInt()}',
                  customerId: ApiKeys.customerId,
                  currency: 'USD',
                );
                BlocProvider.of<PaymentCubit>(context).makepayment(
                    paymentIntentInputModel: paymentIntentInputModel);
              }
            });
      },
    );
  }
}
