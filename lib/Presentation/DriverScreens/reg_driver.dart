import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../validation/driverFormvalidation/driverside_valadation.dart';
import 'reg_driverScreen2.dart';

class RegDriverScreen extends StatelessWidget {
  RegDriverScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final DriversideValadation driversideValadation = DriversideValadation();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orange,
        title: const Text(
          'Driver Registration',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 100),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical, // vertical scrolling
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Personal Information',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  const SizedBox(height: 40),
                  TextFormField(
                    controller: nameController,
                    validator: driversideValadation.validateName,
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      hintText: 'Enter your Full Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.orange,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: emailController,
                    validator: driversideValadation.validateEmail,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'abc@gmail.com',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.orange,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: phoneController,
                    validator: (value) =>
                        driversideValadation.validatePhoneNumber(value),
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      hintText: '03324145420',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.orange,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: addressController,
                    validator: (value) =>
                        driversideValadation.validateAddress(value),
                    decoration: InputDecoration(
                      labelText: 'Address',
                      hintText: 'street, city, country',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.orange,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Get.to(RegDriverScreen2(
                              name:
                                  nameController.text.toString().toUpperCase(),
                            ));
                          }
                        },
                        style: OutlinedButton.styleFrom(
                          alignment: Alignment.centerRight,
                          backgroundColor: Colors.orange,
                        ),
                        child: Text(
                          "Next",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
