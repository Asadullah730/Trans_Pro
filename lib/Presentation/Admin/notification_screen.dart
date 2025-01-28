import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transpro/Contoller/GetXControllers/CargoDetailsController.dart';
import 'package:transpro/Presentation/Admin/admin_dashbord.dart';
import 'package:transpro/Presentation/Admin/map.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  // Instantiate the controller
  final CargoDetailsController controlsDetails =
      Get.put(CargoDetailsController());

  @override
  Widget build(BuildContext context) {
    // Get screen width and height
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Fetch data
    controlsDetails.fetchOrders();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: const Text(
          "Order Notifications",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Obx(() {
        if (controlsDetails.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controlsDetails.cargoDetails.isEmpty) {
          return const Center(child: Text("No drivers registered."));
        }

        return ListView.builder(
          itemCount: controlsDetails.cargoDetails.length,
          itemBuilder: (context, index) {
            final cargo = controlsDetails.cargoDetails[index];
            return Card(
              elevation: 5,
              shadowColor: Colors.orange[200],
              margin: EdgeInsets.symmetric(
                vertical: screenHeight * 0.01,
                horizontal: screenWidth * 0.05,
              ),
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Details: Complete Cargo Details",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text("Source: ${cargo['source'] ?? 'Unknown'}"),
                    Text("Destination: ${cargo['destination'] ?? 'Unknown'}"),
                    Text("Labour: ${cargo['labour'] ?? 'Unknown'}"),
                    Text("Lodge Type: ${cargo['lodgeType'] ?? 'Unknown'}"),
                    Text("Offer Price: ${cargo['offerPrice'] ?? 'Unknown'}"),
                    Text(
                        "Payment Method: ${cargo['paymentMethod'] ?? 'Unknown'}"),
                    Text("Weight Capacity: ${cargo['weight'] ?? '0'} Ton"),
                    Text("Phone: ${cargo['phoneNumber'] ?? 'Unknown'}"),
                    SizedBox(height: screenHeight * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Get.to(() => MapScreen(
                                  distfrom: cargo['source'],
                                  distto: cargo['destination'],
                                ));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.04,
                              vertical: screenHeight * 0.015,
                            ),
                          ),
                          child: const Text(
                            "Get Loc",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            controlsDetails.confirmOrder(cargo[index]);
                            controlsDetails.cancelOrder(index);

                            Get.snackbar(
                              'Confirmation Message',
                              "Order has been confirmed",
                              backgroundColor: Colors.green,
                              colorText: Colors.white,
                            );

                            Get.to(() => AdminDashBoard(
                                  cargoHistory:
                                      controlsDetails.confirmcargo.toList(),
                                ));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.04,
                              vertical: screenHeight * 0.015,
                            ),
                          ),
                          child: const Text(
                            "Confirm",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            controlsDetails.cancelOrder(index);
                            if (kDebugMode) {
                              print(
                                  "Updated Cargo Details List: ${controlsDetails.cargoDetails}");
                            }
                          },
                          child: const Text(
                            "Reject",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
