import 'package:get/get.dart';
import 'package:transpro/Model/DriverModel.dart';

class DriverController extends GetxController {
  // Observable list of drivers
  var regDriver = <Drivermodel>[
    Drivermodel(
        name: "Asad Brohi",
        age: 20,
        email: "asad@gmail.com",
        address: "DG KHAN",
        phone: "03343492634",
        weightCapiacity: 40,
        vhecialNumber: "DGL 131"),
    Drivermodel(
        name: "USMAN Khan",
        age: 40,
        email: "usman@gmail.com",
        address: "DG KHAN",
        phone: "03343492634",
        weightCapiacity: 40,
        vhecialNumber: "DGK 131"),
    Drivermodel(
        name: "Muhammad Haleem",
        age: 20,
        email: "haleemdhakan@gmail.com",
        address: "DG KHAN",
        phone: "03343492634",
        weightCapiacity: 40,
        vhecialNumber: "DBL 135"),
    Drivermodel(
        name: "HAMZA",
        age: 20,
        email: "hamza@gmail.com",
        address: "DG KHAN",
        phone: "03343492634",
        weightCapiacity: 40,
        vhecialNumber: "ISL 136")
  ].obs;

  // Function to remove a driver by index
  void removeDriver(int index) {
    regDriver.removeAt(index);
  }
}
