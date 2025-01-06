import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/snackbar/snackbar_controller.dart';
import 'package:transpro/Model/CargoDetails.dart';
import 'package:transpro/Model/DriverModel.dart';

class Ordercollection {
  final FirebaseFirestore database = FirebaseFirestore.instance;
  Future<void> saveOrders(
    CargoDetailsModel order,
    SnackbarController snackbar,
  ) async {
    try {
      final docRef = database
          .collection("Orders")
          .withConverter(
            fromFirestore: CargoDetailsModel.fromFirestore,
            toFirestore: (CargoDetailsModel order, options) =>
                order.toFirestore(),
          )
          .doc(order.phoneNumber?.isNotEmpty == true
              ? order.phoneNumber
              : database.collection("Orders").doc().id);

      await docRef.set(order);

      debugPrint('Order saved successfully with Name: ${order.phoneNumber}');
      snackbar;
    } catch (e) {
      debugPrint('Failed to save Order: $e');
    }
  }
}
