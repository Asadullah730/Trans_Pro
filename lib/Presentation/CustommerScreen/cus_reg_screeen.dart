import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transpro/Presentation/CustommerScreen/client_dashboard.dart';
import 'package:transpro/component/custom_app_bar.dart';
import 'package:transpro/component/custom_button.dart';
import 'package:transpro/validation/ClientFormValidation/clientSide_validation.dart';

class CustommerRegScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final ClientsideValadation clientsideValadation = ClientsideValadation();
  final TextEditingController cusNameController = TextEditingController();
  final TextEditingController cusEmailController = TextEditingController();
  final TextEditingController cusPhoneController = TextEditingController();
  final TextEditingController cusAddressController = TextEditingController();
  final TextEditingController cusFatherNameController = TextEditingController();
  final TextEditingController cusNationalityController = TextEditingController();
  final TextEditingController cusCnicController = TextEditingController();
  final TextEditingController cusGenderController = TextEditingController();
  String _gender = '';
  List<String> _genders = ['Male', 'Female'];
  CustommerRegScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orange,
        title: const Text(
          'Client Registration',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10.0, bottom: 10, left: 10, right: 20),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical, // vertical scrolling
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    'Personal Information',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  const Text(
                    'Please fill the form below, All field are mandatory!!!',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.orange,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: cusNameController,
                    validator: (value) =>
                        clientsideValadation.validateClientName(value),
                    decoration: InputDecoration(
                      labelText: 'Name',
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
                    controller: cusFatherNameController,
                    validator: (value) =>
                        clientsideValadation.validateClientName(value),
                    decoration: InputDecoration(
                      labelText: 'S/O',
                      hintText: 'Enter your father name !!!',
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
                    controller: cusNationalityController,
                    validator: (value) =>
                        clientsideValadation.validateClientName(value),
                    decoration: InputDecoration(
                      labelText: 'Nationality',
                      hintText: 'Enter your Country name according to CNIC !!!',
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
                    keyboardType: TextInputType.number,
                    controller: cusCnicController,
                    validator: (value) =>
                        clientsideValadation.validateClientCNIC(value),
                    decoration: InputDecoration(
                      labelText: 'CNIC Number',
                      hintText: '32102-5799182-5',
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
                    controller: cusEmailController,
                    validator: (value) =>
                        clientsideValadation.validateClientEmail(value),
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
                    controller: cusPhoneController,
                    validator: (value) =>
                        clientsideValadation.validateClientPhoneNumber(value),
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
                    controller: cusAddressController,
                    validator: (value) =>
                        clientsideValadation.validateClientAddress(value),
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
                  SizedBox(
                    height: 20,
                  ),
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                      labelText: 'Gender',
                      hintText: 'Select your gender',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.orange,
                          width: 2,
                        ),
                      ),
                    ),
                    items: _genders.map((gender) {
                      return DropdownMenuItem(
                        child: Text(gender),
                        value: gender,
                      );
                    }).toList(),
                    validator: (value) =>
                        value == null ? 'Please select your gender' : null,
                    onChanged: (value) {
                      _gender = value!;
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
                                Get.snackbar("Success",
                                    "${cusNameController.text} Registered Successfully",
                                    backgroundColor: Colors.green);
                                Get.to(() => ClientDashBoard(
                                      title: cusNameController.text,
                                    ));
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
