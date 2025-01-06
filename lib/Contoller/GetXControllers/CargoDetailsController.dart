import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:transpro/Model/CargoDetails.dart';

class CargoDetailsController extends GetxController {
  // Observable lists
  var confirmcargo = <CargoDetailsModel>[].obs;
  var cargoDetails = <Map<String, dynamic>>[].obs;
  var isLoading = false.obs;
  FirebaseFirestore database = FirebaseFirestore.instance;
  Future<void> fetchOrders() async {
    isLoading.value = true;
    try {
      QuerySnapshot querySnapshot = await database.collection('Orders').get();
      if (querySnapshot.docs.isNotEmpty) {
        cargoDetails.value = querySnapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();
      } else {
        cargoDetails.clear();
        Get.snackbar('No Data', 'No drivers found in the database.');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to retrieve drivers: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // Remove order from cargoDetails
  void cancelOrder(int index) {
    cargoDetails.removeAt(index);
  }

  // Add order to confirmcargo
  void confirmOrder(CargoDetailsModel order) {
    confirmcargo.add(order);
  }
}
