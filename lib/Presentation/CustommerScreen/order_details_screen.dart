import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transpro/FireStore/driverCollection.dart';
import 'package:transpro/FireStore/orderCollection.dart';
import 'package:transpro/Model/CargoDetails.dart';
import 'package:transpro/Model/DriverModel.dart';
import 'package:transpro/Presentation/Admin/notification_screen.dart';
import 'package:transpro/component/cus_drawer.dart';
import 'package:transpro/component/custom_app_bar.dart';
import 'package:transpro/component/custom_button.dart';
import 'package:transpro/validation/ClientFormValidation/clientSide_validation.dart';

class OrderDetailsScreen extends StatelessWidget {
  OrderDetailsScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController logTypeController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController distFromController = TextEditingController();
  final TextEditingController distToController = TextEditingController();
  final TextEditingController labourController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  String payment = '';
  final List<String> paymentMethod = ["cash on delivery", "online payment"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Cargo Details"),
      drawer: CustomDrawer(),
      body: Container(
        margin: const EdgeInsets.only(top: 20),
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
                    'Cargo Details',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  const SizedBox(height: 40),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: weightController,
                    validator: (value) => value!.isEmpty
                        ? 'Please enter the estimated weight'
                        : null,
                    decoration: InputDecoration(
                      labelText: 'Estimated Weight',
                      hintText: 'Estimated Weight of lodges ( Ton)',
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
                    controller: logTypeController,
                    validator: (value) => value!.isEmpty
                        ? 'Please enter the type of lodge'
                        : null,
                    decoration: InputDecoration(
                      labelText: 'Lodge Type',
                      hintText: 'e.g. (Cloth, Furniture etc)',
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
                        ClientsideValadation().validateClientPhoneNumber(value),
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      hintText: '03343492634',
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
                    controller: distFromController,
                    validator: (value) => value!.isEmpty
                        ? 'Please enter the departure location'
                        : null,
                    decoration: InputDecoration(
                      labelText: 'Source',
                      hintText: 'Enter location which is in Map.',
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
                    controller: distToController,
                    validator: (value) => value!.isEmpty
                        ? 'Please enter the destination location'
                        : null,
                    decoration: InputDecoration(
                      labelText: 'Destination',
                      hintText: 'Enter location which is in Map.',
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
                    controller: labourController,
                    validator: (value) => value!.isEmpty
                        ? 'Please enter the number of labours'
                        : null,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Labour',
                      hintText: 'Enter no.of Lobours (if needed).',
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
                    controller: priceController,
                    validator: (value) => value!.isEmpty
                        ? 'Please enter the number of labours'
                        : null,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: ' Offer Fare',
                      hintText: 'how much you offer for this Trip?',
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
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                      labelText: 'Payment Method',
                      hintText: 'Select payment Method',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.orange,
                          width: 2,
                        ),
                      ),
                    ),
                    items: paymentMethod.map((payMethod) {
                      return DropdownMenuItem(
                        value: payMethod,
                        child: Text(payMethod),
                      );
                    }).toList(),
                    validator: (value) =>
                        value == null ? 'Please select Payment Method' : null,
                    onChanged: (value) {
                      payment = value!;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    text: "C O N F I R M  CARGO",
                    onPressed: () {
                      Get.defaultDialog(
                        title: "Confirm Order Details",
                        titlePadding: const EdgeInsets.only(top: 10),
                        middleText:
                            "All Details of Order are correct? press Yes to confirm",
                        contentPadding: const EdgeInsets.only(top: 0),
                        textConfirm: "Yes",
                        textCancel: "No",
                        confirm: OutlinedButton(
                            onPressed: () {
                              Get.back();
                              if (_formKey.currentState!.validate()) {
                                final cargo = CargoDetailsModel(
                                  phoneNumber: phoneController.text.trim(),
                                  source: distFromController.text.trim(),
                                  destination: distToController.text.trim(),
                                  labour: int.tryParse(
                                          labourController.text.trim()) ??
                                      0,
                                  lodgeType: logTypeController.text.trim(),
                                  offerPrice: double.tryParse(
                                      priceController.text.trim()),
                                  paymentMethod: payment,
                                  weight: double.tryParse(
                                      weightController.text.trim()),
                                );

                                Ordercollection()
                                    .saveOrders(
                                  cargo,
                                  Get.snackbar("Success",
                                      "Your Request Sent Successfully,Contact you soon",
                                      backgroundColor: Colors.green),
                                )
                                    .then((value) {
                                  // Get.to(() =>  NotificationScreen());
                                });
                              } else {
                                Get.snackbar(
                                    "Error", "Please fill all the fields");
                                Get.back();
                              }
                            },
                            child: const Text(
                              "Yes",
                              style: TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold),
                            )),
                        cancel: OutlinedButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: const Text("No",
                                style: TextStyle(
                                    color: Colors.orange,
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
