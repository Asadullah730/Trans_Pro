import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CameraAccessController extends GetxController {
  final ImagePicker picker = ImagePicker();
  Rx<File?> imageFile =
      Rx<File?>(null); // Temporary variable to store the image

  Future<void> pickImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile.value =
          File(pickedFile.path); // Save the selected image temporarily
    }
  }
}
