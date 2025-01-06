import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DriverController extends GetxController {
  var regDriver = <Map<String, dynamic>>[].obs;
  var isLoading = false.obs;
  FirebaseFirestore database = FirebaseFirestore.instance;
  Future<void> fetchDrivers() async {
    isLoading.value = true;
    try {
      QuerySnapshot querySnapshot = await database.collection('Drivers').get();
      if (querySnapshot.docs.isNotEmpty) {
        regDriver.value = querySnapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();
      } else {
        regDriver.clear();
        Get.snackbar('No Data', 'No drivers found in the database.');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to retrieve drivers: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // Function to remove a driver by index
  void removeDriver(int index) {
    regDriver.removeAt(index);
  }
}
