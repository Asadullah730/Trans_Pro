import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transpro/Presentation/DriverScreens/driver_dashboard.dart';
import 'package:transpro/component/custom_button.dart';

class RegDriverScreen2 extends StatelessWidget {
  final String name;
  RegDriverScreen2({required this.name, super.key});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _date = TextEditingController();

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
        margin: const EdgeInsets.only(top: 20),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 40.0, bottom: 20, left: 20, right: 20),
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
                    'More Information',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  const SizedBox(height: 40),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'AGE',
                      hintText: 'Enter your Age',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.orange,
                          width: 2,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your Age';
                      } else if (value.length > 2) {
                        return 'Age must be greater than 18';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Licience Number',
                      hintText: '12212233445563',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.orange,
                          width: 2,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your Licience Number';
                      } else if (value.length < 14) {
                        return 'Licience Number must be 14 digits';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _date,
                    decoration: InputDecoration(
                      labelText: 'Licence Expiry Date',
                      hintText: 'DD/MM/YYYY',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.orange,
                          width: 2,
                        ),
                      ),
                      suffixIcon: const Icon(Icons.calendar_today,
                          color: Colors.orange),
                    ),
                    readOnly: true,
                    onTap: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2025),
                        lastDate: DateTime(2050),
                      );
                      if (picked != null) {
                        _date.text =
                            "${picked.day}/${picked.month}/${picked.year}";
                      }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select the expiry date';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Vhecial Number',
                      hintText: 'DGL 131',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.orange,
                          width: 2,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your Vhecial Number';
                      } else if (value.length < 6) {
                        return 'Vhecial Number must be 6 digits';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Weight Capacity',
                      hintText: '10 Ton',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.orange,
                          width: 2,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your Weight Capacity';
                      } else if (value.length < 2) {
                        return 'Weight Capacity must be 2 digits';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    text: "R E G I S T E R",
                    onPressed: () {
                      Get.defaultDialog(
                        title: "Information Check",
                        titlePadding: const EdgeInsets.only(top: 10),
                        middleText: "Are you sure you want to register?",
                        contentPadding: const EdgeInsets.only(top: 0),
                        textConfirm: "Yes",
                        textCancel: "cancel",
                        confirm: OutlinedButton(
                            onPressed: () {
                              Get.back();
                              if (_formKey.currentState!.validate()) {
                                Get.snackbar(
                                    "Success", "$name Registered Successfully",
                                    backgroundColor: Colors.green);
                                Get.to(() => const DriverDashboard());
                              } else {
                                Get.snackbar(
                                    "Error", "Please fill all the fields");
                                Get.back();
                              }
                            },
                            child: const Text(
                              "Ok",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            )),
                        cancel: OutlinedButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: const Text("Cancel",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold))),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
