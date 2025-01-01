import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
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
                    Stack(
                      children: [
                        const CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              AssetImage('assets/splash_img/app_logo.jpeg'),
                        ),
                        Positioned(
                          top: 65,
                          right: 0,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add_a_photo_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Text(
                  'Trans Pro',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Get.back();
            },
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.person),
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
            title: const Text('logout'),
            onTap: () {
              Get.back();
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}
