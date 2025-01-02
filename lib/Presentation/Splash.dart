import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'authentication_screens/loginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void navigateToHomeScreen() {
    Get.to(() => LoginScreen());
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), navigateToHomeScreen);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/splash_img/app_logo.jpeg",
                height: 150.0,
                width: 150.0,
              ),
              const Text("App running ..."),
            ],
          ),
        ),
      ),
    );
  }
}
