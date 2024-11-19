import 'package:ecommerce_app/auth/view/views/signup_view.dart';
import 'package:ecommerce_app/auth/view/widgets/custom_form_field.dart';
import 'package:ecommerce_app/const.dart';
import 'package:ecommerce_app/views/main_page.dart';
import 'package:ecommerce_app/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String statusMessage = '';
  bool isPasswordVisible = false;

  Future<void> loginUser() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainPage()),
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        if (e.code == 'wrong-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('The password you entered is incorrect.')),
          );
        } else if (e.code == 'user-not-found') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Email or password is incorrect.')),
          );
        } else if (e.code == 'invalid-email') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please enter valid email address.')),
          );
        } else if (e.code == 'invalid-credential') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Email or password is incorrect.')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Login failed. Please try again.')),
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
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
                controller: emailController,
                hintText: 'Email',
                isPassword: false,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomFormField(
                controller: passwordController,
                hintText: 'Password',
                isPassword: true,
                isPasswordVisible: isPasswordVisible,
                onTogglePasswordVisibility: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
              ),
              const SizedBox(
                height: 60,
              ),
              CustomButton(
                onPressed: () {
                  loginUser();
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
                              fontWeight: FontWeight.bold, color: primaryColor))
                    ])),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
