import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transpro/Contoller/GetXControllers/CustommerDataController.dart';

class RegCustommerDataScreen extends StatelessWidget {
  RegCustommerDataScreen({super.key});

  // Instantiate the DriverController
  final CustommerDataController custommerDataController =
      Get.put(CustommerDataController());

  @override
  Widget build(BuildContext context) {
    custommerDataController.fetchCustommer();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: const Text(
          "Registered Custommer",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Obx(() {
        if (custommerDataController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (custommerDataController.regCustommer.isEmpty) {
          return const Center(child: Text("No Custommer registered."));
        }

        return ListView.builder(
          itemCount: custommerDataController.regCustommer.length,
          itemBuilder: (context, index) {
            final custommer = custommerDataController.regCustommer[index];
            return Card(
              elevation: 5,
              shadowColor: Colors.orange[200],
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
              child: ListTile(
                title: Text(
                  "Name : ${custommer['name'] ?? 'Unknown'} S/O ${custommer['fatherName'] ?? 'Unknown'}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Email :${custommer['email'] ?? 'Unknown'}"),
                    Text("Phone Number:${custommer['phone'] ?? 'Unknown'}"),
                    Text("Address : ${custommer['address'] ?? 'Unknown'}"),
                    Text("Cnic :${custommer['cnic'] ?? 'Unknown'}"),
                    Text("Gender :${custommer['gender'] ?? 'Unknown'}"),
                    Text(
                        "Nationality:${custommer['nationality'] ?? 'Unknown'}"),
                  ],
                ),
                trailing: TextButton(
                  onPressed: () {
                    Get.defaultDialog(
                      title: "Aleart Message",
                      titlePadding: const EdgeInsets.only(top: 10),
                      middleText:
                          "Are you sure you want to Remove this Driver?",
                      contentPadding: const EdgeInsets.only(top: 0),
                      textConfirm: "Yes",
                      textCancel: "cancel",
                      confirm: OutlinedButton(
                          onPressed: () {
                            custommerDataController.removeCustommer(index);
                            Get.back();
                            Get.snackbar(
                              "Deletion Message ",
                              "Custommer : ${custommer['name']} is Removed Successfully",
                            );
                          },
                          child: const Text(
                            "Ok",
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
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
                  child: const Text(
                    "Delete",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
