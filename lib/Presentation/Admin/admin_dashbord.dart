import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transpro/Model/CargoDetails.dart';
import 'package:transpro/Presentation/Admin/driverData.dart';
import 'package:transpro/Presentation/Admin/notification_screen.dart';
import 'package:transpro/Presentation/Admin/order_history.dart';
import 'package:transpro/Presentation/Admin/reg_custommerData.dart';
import 'package:transpro/Presentation/authentication_screens/loginScreen.dart';
import 'package:transpro/component/cus_drawer.dart';
import 'package:transpro/component/custom_button.dart';

class AdminDashBoard extends StatelessWidget {
  List<CargoDetailsModel>? cargoHistory = [];
  FirebaseAuth auth = FirebaseAuth.instance;
  AdminDashBoard({super.key, this.cargoHistory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: const Text(
          "Admin Dashboard",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => NotificationScreen());
            },
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              auth.signOut().then((_) {
                Get.to(() => LoginScreen());
              });
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomButton(
                text: "Registered Drivers",
                onPressed: () {
                  Get.to(() => DriverDataScreen());
                }),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
                text: "Registered Custommer",
                onPressed: () {
                  Get.to(() => RegCustommerDataScreen());
                }),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
                text: "C A R G O  HISTORY",
                onPressed: () {
                  Get.to(() => OrderHistory(
                        acceptedCargo: cargoHistory ?? [],
                      ));
                }),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
