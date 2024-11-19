import 'package:ecommerce_app/auth/view/views/signup_view.dart';
import 'package:ecommerce_app/auth/view/widgets/custom_form_field.dart';
import 'package:ecommerce_app/const.dart';
import 'package:ecommerce_app/views/main_page.dart';
import 'package:ecommerce_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final emailContorller = TextEditingController();
  final passwordContorller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                  const Text(
                    'Sign In',
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomFormField(
                      hintText: 'Email', controller: emailContorller),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomFormField(
                    hintText: 'Password',
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
                    text: 'Log In',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => SignupPage()));
                    },
                    child: RichText(
                        text: TextSpan(
                            text: "Don't have an account?  ",
                            style: Theme.of(context).textTheme.titleMedium,
                            children: const [
                          TextSpan(
                              text: 'Sign Up',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor))
                        ])),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
