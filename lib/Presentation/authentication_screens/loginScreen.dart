import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transpro/Contoller/firebase_auth.dart/firebase_auth.dart';
import '../../validation/form_validation/authenticationform_validation.dart';
import '../../component//custom_button.dart';
import '../HomeScreen.dart';
import 'SignUpScreen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final RxBool _obscureText = true.obs;

  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  // Color(0xFF1A1D23),
                  Colors.blue,
                  Colors.white,
                  Colors.green,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30, bottom: 0),
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey, // Assign the _formKey to the Form widget
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 20,
                    ),
                    // SignUp Page Icon
                    const CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/splash_img/app_logo.jpeg"),
                      radius: 100,
                    ),
                    const SizedBox(height: 30),
                    const Center(
                      child: Column(
                        children: [
                          Text(
                            'Login',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: Colors.orange,
                            ),
                          ),
                          Text(
                            'Login to Continue Transport App',
                            style: TextStyle(
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),
                    TextFormField(
                      validator: (value) =>
                          AuthenticationformValidation().validateEmail(value),
                      controller: _emailcontroller,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email),
                        labelText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    Obx(
                      () => TextFormField(
                        obscureText: _obscureText.value,
                        controller: _passwordcontroller,
                        decoration: InputDecoration(
                          labelText: "Password",
                          hintText: "Enter your Password",
                          prefixIcon: const Icon(Icons.lock),
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              _obscureText.value = !_obscureText.value;
                            },
                          ),
                        ),
                        validator: (value) => AuthenticationformValidation()
                            .validatePassword(value),
                      ),
                    ),

                    const SizedBox(height: 40),
                    CustomButton(
                      text: "L O G I N",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          FirebaseAuthController()
                              .signInWithEmailAndPassword(_emailcontroller.text,
                                  _passwordcontroller.text)
                              .then((value) {
                            if (value != null) {
                              Get.to(const HomeScreen());
                              Get.snackbar(
                                'Authentication Message',
                                'Login Successfully',
                                duration: const Duration(seconds: 2),
                                backgroundColor: Colors.purple,
                                colorText: Colors.white,
                              );
                            } else {
                              Get.snackbar(
                                'Authentication Message',
                                'Login Failed, Please try again',
                                duration: const Duration(seconds: 2),
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                              );
                            }
                          });
                        }
                      },
                    ),

                    Row(
                      children: [
                        const Text("you Don't have Account ? "),
                        const SizedBox(width: 10),
                        TextButton(
                          onPressed: () {
                            Get.to(SignUpScreen());
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(color: Colors.orange[200]),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
