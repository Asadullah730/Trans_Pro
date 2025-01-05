import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transpro/Contoller/GetXControllers/CustommerDataController.dart';
import 'package:transpro/component/custom_app_bar.dart';

class RegCustommerDataScreen extends StatelessWidget {
  RegCustommerDataScreen({super.key});

  // Instantiate the DriverController
  final CustommerDataController custommerDataController =
      Get.put(CustommerDataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Registered Custommer"),
      body: Obx(
        () => custommerDataController.regCustommer.isNotEmpty
            ? ListView.builder(
                itemCount: custommerDataController.regCustommer.length,
                itemBuilder: (context, index) {
                  final client = custommerDataController.regCustommer[index];
                  return Card(
                    elevation: 5,
                    shadowColor: Colors.orange[200],
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                    child: ListTile(
                      title: Text(
                        "Name : ${client.name} S/O ${client.fatherName}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Address : ${client.address}"),
                          Text("Gender : ${client.gender}"),
                          Text("Email: ${client.email}"),
                          Text("Nationality: ${client.nationality} "),
                          Text("Call: ${client.phoneNumber}"),
                        ],
                      ),
                      trailing: TextButton(
                        onPressed: () {
                          Get.defaultDialog(
                            title: "Aleart Message",
                            titlePadding: const EdgeInsets.only(top: 10),
                            middleText:
                                "Are you sure you want to Remove this Custommer?",
                            contentPadding: const EdgeInsets.only(top: 0),
                            textConfirm: "Yes",
                            textCancel: "cancel",
                            confirm: OutlinedButton(
                                onPressed: () {
                                  custommerDataController
                                      .removeCustommer(index);
                                  Get.back();
                                  Get.snackbar(
                                    "Deletion Message ",
                                    "Custommer : ${custommerDataController.regCustommer[index].name} is Removed",
                                  );
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
                        child: const Text(
                          "Delete",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                  );
                },
              )
            : const Center(
                child: Text(
                  "No clients available.",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
      ),
    );
  }
}
