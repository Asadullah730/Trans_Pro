import 'package:flutter/material.dart';
import 'package:transpro/Presentation/DriverScreens/widgets/cus_drawer.dart';
import 'package:transpro/component/custom_app_bar.dart';
import 'package:transpro/component/custom_button.dart';

class AdminDashBoard extends StatelessWidget {
  const AdminDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Hi, Asad Brohi"),
      drawer: CustomDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomButton(text: "Registered Drivers", onPressed: () {}),
            const SizedBox(
              height: 20,
            ),
            CustomButton(text: "Registered Custommer", onPressed: () {}),
            const SizedBox(
              height: 20,
            ),
            CustomButton(text: "Get Drivers Location", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
