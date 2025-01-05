import 'package:get/get.dart';
import 'package:transpro/Model/CargoDetails.dart';

class CargoDetailsController extends GetxController {
  // Observable lists
  var confirmcargo = <CargoDetailsModel>[].obs;
  var cargoDetails = <CargoDetailsModel>[
    CargoDetailsModel(
        phoneNumber: "03343492634",
        source: "Islamabad",
        destination: "Abbottabad",
        labour: 3,
        lodgeType: "cloth",
        offerPrice: 5000,
        paymentMethod: "online Payment",
        weight: 40),
    CargoDetailsModel(
        phoneNumber: "03343492634",
        source: "Lahore",
        destination: "DG Khan",
        labour: 2,
        lodgeType: "cloth",
        offerPrice: 10000,
        paymentMethod: "online Payment",
        weight: 40),
    CargoDetailsModel(
        phoneNumber: "03343492634",
        source: "DG Khan",
        destination: "MULTAN",
        labour: 4,
        lodgeType: "cloth",
        offerPrice: 11000,
        paymentMethod: "online Payment",
        weight: 40)
  ].obs;

  // Remove order from cargoDetails
  void cancelOrder(int index) {
    cargoDetails.removeAt(index);
  }

  // Add order to confirmcargo
  void confirmOrder(CargoDetailsModel order) {
    confirmcargo.add(order);
  }
}
