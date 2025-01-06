import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CustommerDataController extends GetxController {
  var regCustommer = <Map<String, dynamic>>[].obs;
  var isLoading = false.obs;
  FirebaseFirestore database = FirebaseFirestore.instance;
  Future<void> fetchCustommer() async {
    isLoading.value = true;
    try {
      QuerySnapshot querySnapshot =
          await database.collection('Custommer').get();
      if (querySnapshot.docs.isNotEmpty) {
        regCustommer.value = querySnapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();
      } else {
        regCustommer.clear();
        Get.snackbar('No Data', 'No Custommer found in the database.');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to retrieve drivers: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void removeCustommer(int index) {
    regCustommer.removeAt(index);
  }
}
