import 'package:ecommerce_app/payment/cubit/payment_cubit.dart';
import 'package:ecommerce_app/payment/cubit/payment_state.dart';
import 'package:ecommerce_app/payment/models/payment_intent_input_model.dart';
import 'package:ecommerce_app/payment/views/thank_you_view.dart';
import 'package:ecommerce_app/provider/cart_provider.dart';
import 'package:ecommerce_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class CustomButtonBlocCunsumer extends StatelessWidget {
  const CustomButtonBlocCunsumer({
    super.key,
  });

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
 PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(

      amount: '${(cartProvider.totalPrice * 100).toInt()}',
      currency: 'USD',
    );
    BlocProvider.of<PaymentCubit>(context)
        .makepayment(paymentIntentInputModel: paymentIntentInputModel);
          },
        );
      },
    );
  }
}
