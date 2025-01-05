import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:transpro/Contoller/GetXControllers/cameraController.dart';
import 'package:transpro/Presentation/HomeScreen.dart';
import 'package:transpro/Presentation/authentication_screens/loginScreen.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? img;
  final CameraAccessController cameraAccessController =
      Get.put(CameraAccessController());

  final Rx<File?> imgpath = Rx<File?>(File('assets/splash_img/app_logo.jpeg'));

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.orange,
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => Stack(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                cameraAccessController.imageFile.value != null
                                    ? FileImage(
                                        cameraAccessController.imageFile.value!)
                                    : FileImage(imgpath.value!),
                          ),
                          Positioned(
                            top: 65,
                            right: 0,
                            child: IconButton(
                              onPressed: () {
                                cameraAccessController
                                    .pickImageFromGallery()
                                    .then(
                                  (value) {
                                    imgpath.value =
                                        cameraAccessController.imageFile.value;

                                    print(
                                        "IMAGE PATH :${cameraAccessController.imageFile.value as String}");
                                  },
                                );
                              },
                              icon: const Icon(
                                Icons.add_a_photo_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Text(
                  'TransPro',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Get.back();
              Get.to(() => HomeScreen());
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('About Us'),
            onTap: () {
              Get.back();
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.contact_mail),
            title: const Text('Contact Us'),
            onTap: () {
              Get.back();
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              Get.back();
              Get.back();
              _auth.signOut();
              Get.to(LoginScreen());
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}
