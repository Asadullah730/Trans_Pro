import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:transpro/Model/ImagesModel.dart';
import 'package:transpro/Presentation/DriverScreens/widgets/cus_drawer.dart';
import 'package:transpro/component/custom_app_bar.dart';

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
        margin: EdgeInsets.only(top: 20, left: 10, right: 10),
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 2),
                enlargeCenterPage: false,
                viewportFraction: 1,
                height: 250,
                aspectRatio: 16 / 9,
                animateToClosest: true,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
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
            )
          ],
        ),
      ),
    );
  }
}
