import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transpro/Contoller/GetXControllers/DriverDataController.dart';
import 'package:transpro/Model/DriverModel.dart';
import 'package:transpro/Presentation/Admin/map.dart';
import 'package:transpro/component/custom_app_bar.dart';
import 'package:transpro/component/custom_button.dart';

class DriverDataScreen extends StatelessWidget {
  DriverDataScreen({super.key});

  // Instantiate the DriverController
  final DriverController driverController = Get.put(DriverController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Registered Driver"),
      body: Obx(
        () => driverController.regDriver.isNotEmpty
            ? ListView.builder(
                itemCount: driverController.regDriver.length,
                itemBuilder: (context, index) {
                  final driver = driverController.regDriver[index];
                  return Card(
                    elevation: 5,
                    shadowColor: Colors.orange[200],
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                    child: ListTile(
                      title: Text(
                        "Name : ${driver.name}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Address : ${driver.address}"),
                          Text("AGE : ${driver.age}"),
                          Text("Email: ${driver.email}"),
                          Text(
                              "Weight Capicity: ${driver.weightCapiacity} Ton"),
                          Text("Call: ${driver.phone}"),
                          Text("Vehical Number :${driver.vhecialNumber}"),
                          CustomButton(
                              text: "Get Location",
                              onPressed: () {
                                Get.to(MapScreen(
                                    distfrom:
                                        "Click on icon to get current Loc",
                                    distto:
                                        driver.address ?? "Unknown Address"));
                              })
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
                                  driverController.removeDriver(index);
                                  Get.back();
                                  Get.snackbar(
                                    "Deletion Message ",
                                    "Driver : ${driverController.regDriver[index].name} is Removed",
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
                  "No drivers available.",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
      ),
    );
  }
}