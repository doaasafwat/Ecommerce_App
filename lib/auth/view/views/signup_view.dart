import 'package:ecommerce_app/auth/view/views/login_view.dart';
import 'package:ecommerce_app/auth/view/widgets/custom_form_field.dart';
import 'package:ecommerce_app/const.dart';
import 'package:ecommerce_app/views/main_page.dart';
import 'package:ecommerce_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  final nameContorller = TextEditingController();
  final emailContorller = TextEditingController();
  final passwordContorller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomFormField(
                  hintText: 'Name',
                  controller: nameContorller,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomFormField(
                  hintText: 'Email',
                  controller: emailContorller,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomFormField(
                  hintText: 'Password',
                  controller: passwordContorller,
                  isObsecure: true,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomFormField(
                  hintText: 'Confirm Password',
                  controller: passwordContorller,
                  isObsecure: true,
                ),
                const SizedBox(
                  height: 60,
                ),
                CustomButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainPage(),
                      ),
                    );
                  },
                  text: 'Sign Up',
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (BuildContext context) => LoginPage(),
                      ),
                    );
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Already have an account?  ',
                      style: Theme.of(context).textTheme.titleMedium,
                      children: const [
                        TextSpan(
                          text: 'Sign in',
                          style: TextStyle(
                              color: primaryColor, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
