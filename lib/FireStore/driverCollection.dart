import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/snackbar/snackbar_controller.dart';
import 'package:transpro/Model/DriverModel.dart';

class Drivercollection {
  final FirebaseFirestore database = FirebaseFirestore.instance;
  Future<void> saveDriverData(
    Drivermodel driver,
    SnackbarController snackbar,
  ) async {
    try {
      final docRef = database
          .collection("Drivers")
          .withConverter(
            fromFirestore: Drivermodel.fromFirestore,
            toFirestore: (Drivermodel driver, options) => driver.toFirestore(),
          )
          .doc(driver.name?.isNotEmpty == true
              ? driver.name
              : database.collection("Drivers").doc().id);

      await docRef.set(driver);

      debugPrint('Driver saved successfully with Name: ${driver.name}');
      snackbar;
    } catch (e) {
      debugPrint('Failed to save Driver: $e');
    }
  }
}
