import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transpro/Contoller/firebase_auth.dart/firebase_auth.dart';

import '../../validation/form_validation/authenticationform_validation.dart';
import '../../component/custom_button.dart';
import 'loginScreen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _confirmpasswordcontroller = TextEditingController();
  final RxBool _obscureText = true.obs;
  final RxBool _obscureText1 = true.obs;

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
            margin: const EdgeInsets.only(top: 20, bottom: 40),
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
                    const SizedBox(height: 10),
                    const Center(
                      child: Text(
                        'SignUp',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      validator: (value) =>
                          AuthenticationformValidation().validateName(value),
                      decoration: InputDecoration(
                        labelText: "Name :",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
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
                          hintText: "Password",
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
                    const SizedBox(height: 20),
                    Obx(
                      () => TextFormField(
                        obscureText: _obscureText1.value,
                        controller: _confirmpasswordcontroller,
                        decoration: InputDecoration(
                          labelText: "Confirm Password",
                          hintText: "Confirm Password",
                          prefixIcon: const Icon(Icons.lock),
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText1.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              _obscureText1.value = !_obscureText1.value;
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Confirm Password is required";
                          } else if (value != _passwordcontroller.text) {
                            return "Passwords does not match!!!";
                          }
                          return null; // Validation passed
                        },
                      ),
                    ),
                    const SizedBox(height: 40),
                    CustomButton(
                      text: "R E G I S T E R",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          FirebaseAuthController()
                              .registerWithEmailAndPassword(
                                  _emailcontroller.text,
                                  _passwordcontroller.text)
                              .then((Value) {
                            if (Value != null) {
                              Get.to(LoginScreen());
                              Get.snackbar(
                                'Authentication Message',
                                'Your account has been created successfully',
                                backgroundColor: Colors.green,
                                colorText: Colors.white,
                              );
                            } else {
                              Get.snackbar(
                                'Authentication Message',
                                'Error in creating account',
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
                        const Text("Already have an Account! ?"),
                        const SizedBox(width: 10),
                        TextButton(
                          onPressed: () {
                            Get.to(LoginScreen());
                          },
                          child: Text(
                            "Login",
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
