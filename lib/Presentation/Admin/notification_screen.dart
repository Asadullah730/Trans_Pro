import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transpro/Contoller/GetXControllers/CargoDetailsController.dart';
import 'package:transpro/Model/CargoDetails.dart';
import 'package:transpro/Presentation/Admin/admin_dashbord.dart';
import 'package:transpro/Presentation/Admin/map.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  // Instantiate the controller
  final CargoDetailsController controlsDetails =
      Get.put(CargoDetailsController());

  @override
  Widget build(BuildContext context) {
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
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
              child: ListTile(
                title: const Text(
                  "Details: Complete Cargo Details",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("source :${cargo['source'] ?? 'Unknown'}"),
                    Text("destination:${cargo['destination'] ?? 'Unknown'}"),
                    Text("labour : ${cargo['labour'] ?? 'Unknown'}"),
                    Text("lodgeType :${cargo['lodgeType'] ?? 'Unknown'}"),
                    Text("offerPrice :${cargo['offerPrice'] ?? 'Unknown'}"),
                    Text(
                        "paymentMethod :${cargo['paymentMethod'] ?? 'Unknown'}"),
                    Text("weight Capacity:${cargo['weight'] ?? '0'} Ton"),
                    Text("phone :${cargo['phoneNumber'] ?? 'Unknown'}"),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OutlinedButton(
                            onPressed: () {
                              Get.to(() => MapScreen(
                                    distfrom: cargo['source'],
                                    distto: cargo['destination'],
                                  ));
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  WidgetStateProperty.all<Color>(Colors.orange),
                              foregroundColor:
                                  WidgetStateProperty.all<Color>(Colors.white),
                            ),
                            child: const Text("Get Loc"),
                          ),
                          OutlinedButton(
                            onPressed: () {
                              controlsDetails.confirmOrder(cargo[index]);
                              controlsDetails.cancelOrder(index);

                              Get.snackbar('Confirmation Message',
                                  "order has been Confirm");

                              Get.to(() => AdminDashBoard(
                                    cargoHistory:
                                        controlsDetails.confirmcargo.toList(),
                                  ));
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  WidgetStateProperty.all<Color>(Colors.orange),
                              foregroundColor:
                                  WidgetStateProperty.all<Color>(Colors.white),
                            ),
                            child: const Text("Confirm"),
                          )
                        ])
                  ],
                ),
                trailing: TextButton(
                    onPressed: () {
                      // Remove the card from the cargoDetails list
                      controlsDetails.cancelOrder(index);
                      if (kDebugMode) {
                        print(
                            "Updated Cargo Details List: ${controlsDetails.cargoDetails}");
                      }
                    },
                    child: const Text(
                      "Reject",
                      style: TextStyle(color: Colors.red),
                    )),
              ),
            );
          },
        );
      }),
    );
  }
}









// return Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: const Text(
//             "Customer Notification",
//             style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//           ),
//           backgroundColor: Colors.orange,
//         ),
//         body: Obx(() {
//           controlsDetails.cargoDetails.isEmpty
//               ? const Center(
//                   child: Text(
//                     "You don't have any notifications",
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 14,
//                     ),
//                   ),
//                 )
//               : ListView.builder(
//                   itemCount: controlsDetails.cargoDetails.length,
//                   itemBuilder: (context, index) {
//                     final cargo = controlsDetails.cargoDetails[index];
//                     return Card(
//                       elevation: 5,
//                       shadowColor: Colors.orange[200],
//                       margin: const EdgeInsets.symmetric(
//                           vertical: 8, horizontal: 24),
//                       child: ListTile(
//                         title: const Text(
//                           "Details: Complete Cargo Details",
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold, fontSize: 15),
//                         ),
//                         subtitle: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text("source :${cargo['source'] ?? 'Unknown'}"),
//                             Text(
//                                 "destination:${cargo['destination'] ?? 'Unknown'}"),
//                             Text("labour : ${cargo['labour'] ?? 'Unknown'}"),
//                             Text(
//                                 "lodgeType :${cargo['lodgeType'] ?? 'Unknown'}"),
//                             Text(
//                                 "offerPrice :${cargo['offerPrice'] ?? 'Unknown'}"),
//                             Text(
//                                 "paymentMethod :${cargo['paymentMethod'] ?? 'Unknown'}"),
//                             Text(
//                                 "weight Capacity:${cargo['weight'] ?? '0'} Ton"),
//                             Text("phone :${cargo['phoneNumber'] ?? 'Unknown'}"),
//                             Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   OutlinedButton(
//                                     onPressed: () {
//                                       Get.to(() => MapScreen(
//                                             distfrom: cargo['source'],
//                                             distto: cargo['destination'],
//                                           ));
//                                     },
//                                     style: ButtonStyle(
//                                       backgroundColor:
//                                           WidgetStateProperty.all<Color>(
//                                               Colors.orange),
//                                       foregroundColor:
//                                           WidgetStateProperty.all<Color>(
//                                               Colors.white),
//                                     ),
//                                     child: const Text("Get Loc"),
//                                   ),
//                                   OutlinedButton(
//                                     onPressed: () {
//                                       controlsDetails.confirmOrder(cargo as CargoDetailsModel);
//                                       controlsDetails.cancelOrder(index);

//                                       Get.to(() => AdminDashBoard(
//                                             cargoHistory:
//                                                 controlsDetails.confirmcargo,
//                                           ));
//                                     },
//                                     style: ButtonStyle(
//                                       backgroundColor:
//                                           WidgetStateProperty.all<Color>(
//                                               Colors.orange),
//                                       foregroundColor:
//                                           WidgetStateProperty.all<Color>(
//                                               Colors.white),
//                                     ),
//                                     child: const Text("Confirm"),
//                                   )
//                                 ])
//                           ],
//                         ),
//                         trailing: TextButton(
//                             onPressed: () {
//                               // Remove the card from the cargoDetails list
//                               controlsDetails.cancelOrder(index);
//                               if (kDebugMode) {
//                                 print(
//                                     "Updated Cargo Details List: ${controlsDetails.cargoDetails}");
//                               }
//                             },
//                             child: const Text(
//                               "Reject",
//                               style: TextStyle(color: Colors.red),
//                             )),
//                       ),
//                     );
//                   });
//         }));