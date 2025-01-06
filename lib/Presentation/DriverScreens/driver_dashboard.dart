import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transpro/Model/ImagesModel.dart';
import 'package:transpro/Presentation/DriverScreens/driverNotification.dart';
import 'package:transpro/component/cus_drawer.dart';
import 'package:transpro/component/custom_button.dart';

class DriverDashboard extends StatelessWidget {
  DriverDashboard({super.key});
  Imagesmodel path = Imagesmodel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            const Center(
              child: Text(
                "Services",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlue),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: path.imgPath.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(5),
                    child: Image.asset(
                      path.imgPath[index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            CustomButton(
                text: "Check order",
                onPressed: () {
                  Get.to(() => DriverNotificationScreen());
                })
          ],
        ),
      ),
    );
  }
}
