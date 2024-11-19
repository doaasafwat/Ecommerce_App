import 'package:ecommerce_app/auth/view/views/login_view.dart';
import 'package:ecommerce_app/auth/view/widgets/custom_form_field.dart';
import 'package:ecommerce_app/const.dart';
import 'package:ecommerce_app/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  String statusMessage = '';

  Future<void> registerUser() async {
    if (usernameController.text.isEmpty) {
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Username is required')),
        );
      });
      return;
    }
    if (passwordController.text != confirmPasswordController.text) {
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Passwords do not match')),
        );
      });
      return;
    }

    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>  LoginPage()),
        );
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(e.message ?? "Registration failed. Try again.")),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Form(
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
                  isPassword: false,
                  controller: usernameController,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomFormField(
                  hintText: 'Email',
                  isPassword: false,
                  controller: emailController,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomFormField(
                  hintText: 'Password',
                  controller: passwordController,
                  isObsecure: true,
                  isPassword: true,
                    isPasswordVisible: isPasswordVisible,
                    onTogglePasswordVisibility: () {
                      setState(() {
                        isPasswordVisible =
                            !isPasswordVisible; 
                      });
                    },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomFormField(
                    hintText: 'Confirm Password',
                    controller: confirmPasswordController,
                    isObsecure: true,
                    isPassword: true,
                    isPasswordVisible: isConfirmPasswordVisible,
                    onTogglePasswordVisibility: () {
                      setState(() {
                        isConfirmPasswordVisible =
                            !isConfirmPasswordVisible; 
                      });
                    }),
                const SizedBox(
                  height: 60,
                ),
                CustomButton(
                  onPressed: () {
                    registerUser();
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
