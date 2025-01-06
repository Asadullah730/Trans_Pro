import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/snackbar/snackbar_controller.dart';
import 'package:transpro/Model/CustommerModel.dart';

class CustommerCollection {
  final FirebaseFirestore database = FirebaseFirestore.instance;
  int id = 0;
  Future<void> saveCustommerData(
    ClientModel custommer,
    SnackbarController snackbar,
  ) async {
    try {
      final docRef = database
          .collection("Custommer")
          .withConverter(
            fromFirestore: ClientModel.fromFirestore,
            toFirestore: (ClientModel driver, options) => driver.toFirestore(),
          )
          .doc(custommer.cnic?.isNotEmpty == true
              ? custommer.cnic
              : database.collection("Custommer").doc().id);

      await docRef.set(custommer as ClientModel);

      debugPrint('Custommer saved successfully with Name: ${custommer.name}');
      snackbar;
    } catch (e) {
      debugPrint('Failed to save Custommer: $e');
    }
  }
}
