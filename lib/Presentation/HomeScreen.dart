import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../component/custom_button.dart';
import 'DriverScreens/reg_driver.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome To TranspoPro",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: CustomButton(
                text: "Register As Driver",
                onPressed: () => Get.to(RegDriverScreen())),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
              child:
                  CustomButton(text: "Register As Custommer", onPressed: () {}))
        ],
      ),
    );
  }
}
