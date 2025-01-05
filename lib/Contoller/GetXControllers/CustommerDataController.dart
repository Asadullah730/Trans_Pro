import 'package:get/get.dart';
import 'package:transpro/Model/CustommerModel.dart';

class CustommerDataController extends GetxController {
  var regCustommer = <ClientModel>[
    ClientModel(
        name: "Asad Brohi",
        fatherName: "Nabi Bakhsh",
        address: "DG Khan",
        email: "asadkhan@gmail.com",
        gender: "Male",
        nationality: "Pakistani",
        phoneNumber: "03343492634"),
    ClientModel(
        name: "Haleem Dhakan😂",
        fatherName: "ABC ",
        address: "Kohat",
        email: "asadkhan@gmail.com",
        gender: "Male",
        nationality: "Pakistani",
        phoneNumber: "03343492634"),
    ClientModel(
        name: "Umer Charsi😂",
        fatherName: "Sibghat Ullah",
        address: "Lahore",
        email: "asadkhan@gmail.com",
        gender: "Male",
        nationality: "Pakistani",
        phoneNumber: "03343492634"),
    ClientModel(
        name: "Aarij Powedri😂",
        fatherName: "Azeem ",
        address: "Rawalpindi",
        email: "asadkhan@gmail.com",
        gender: "Male",
        nationality: "Pakistani",
        phoneNumber: "03343492634")
  ].obs;
  void removeCustommer(int index) {
    regCustommer.removeAt(index);
  }
}
