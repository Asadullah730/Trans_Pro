import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transpro/Model/ImagesModel.dart';
import 'package:transpro/component/cus_drawer.dart';
import 'package:transpro/component/custom_app_bar.dart';
import 'package:transpro/component/custom_button.dart';

import 'order_details_screen.dart';

class ClientDashBoard extends StatelessWidget {
  final String? title;
  ClientDashBoard({required this.title, super.key});

  // Initialize the Imagesmodel instance
  Imagesmodel path = Imagesmodel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Welcome $title "),
      drawer: CustomDrawer(),
      body: Container(
        margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 2),
                enlargeCenterPage: false,
                viewportFraction: 1,
                height: 250,
                aspectRatio: 16 / 9,
                animateToClosest: true,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
              ),
              items: path.imgPath.map((path) {
                return Builder(
                  builder: (BuildContext context) {
                    return Image.asset(
                      path,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(
              height: 50,
            ),
            CustomButton(
                text: "Cargo Details",
                onPressed: () {
                  Get.to(() => OrderDetailsScreen());
                })
          ],
        ),
      ),
    );
  }
}
