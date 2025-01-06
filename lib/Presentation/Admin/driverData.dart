import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transpro/Contoller/GetXControllers/DriverDataController.dart';
import 'package:transpro/Presentation/Admin/map.dart';
import 'package:transpro/component/custom_button.dart';

class DriverDataScreen extends StatelessWidget {
  DriverDataScreen({super.key});
  final DriverController driverController = Get.put(DriverController());

  @override
  Widget build(BuildContext context) {
    driverController.fetchDrivers();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: const Text(
          "Registered Drivers",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Obx(() {
        if (driverController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (driverController.regDriver.isEmpty) {
          return const Center(child: Text("No drivers registered."));
        }

        return ListView.builder(
          itemCount: driverController.regDriver.length,
          itemBuilder: (context, index) {
            final driver = driverController.regDriver[index];
            return Card(
              elevation: 5,
              shadowColor: Colors.orange[200],
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
              child: ListTile(
                title: Text(
                  "Name : ${driver['name'] ?? 'Unknown'}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Email :${driver['email'] ?? 'Unknown'}"),
                    Text("Phone Number:${driver['phone'] ?? 'Unknown'}"),
                    Text("Address : ${driver['address'] ?? 'Unknown'}"),
                    Text("Age :${driver['age'] ?? 'Unknown'}"),
                    Text("Cnic :${driver['cnic'] ?? 'Unknown'}"),
                    Text(
                        "LicenceNumber :${driver['licenseNumber'] ?? 'Unknown'}"),
                    Text("Capicity :${driver['weightCapiacity'] ?? '0'} Ton"),
                    Text("Lic Number :${driver['licenseNumber'] ?? 'Unknown'}"),
                    Text("Vhecial Num:${driver['vhecialNumber'] ?? "Unknown"}"),
                    CustomButton(
                        text: "Get Location",
                        onPressed: () {
                          Get.to(MapScreen(
                              distfrom: "Click on icon to get current Loc",
                              distto: driver['address'] ?? "Unknown Address"));
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
                              "Driver is Removed Successfully",
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
