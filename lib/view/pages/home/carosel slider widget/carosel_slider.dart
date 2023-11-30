// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scipro_application/view/colors/colors.dart';
import 'package:scipro_application/view/fonts/google_poppins.dart';

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Center(
        child: CarouselSlider(
          items: [
            CaroselmageWidget(
              sliderImagePath: imagesList[0],
          
              slidertext: 'Scipro Language Courses',
            ),
            CaroselmageWidget(
              sliderImagePath: imagesList[1],
              slidertext: 'Online Courses',
            ),
            CaroselmageWidget(
              sliderImagePath: imagesList[2],
              slidertext: 'Recorded Courses',
            ),
            CaroselmageWidget(
              sliderImagePath: imagesList[3],
              slidertext: 'Scipro Skill Technology',
            ),
          ],
          options: CarouselOptions(
            height: 280.w,
            enlargeCenterPage: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 2),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
          ),
        ),
      ),
    );
  }
}

class CaroselmageWidget extends StatelessWidget {
  String sliderImagePath;
  String slidertext;
  CaroselmageWidget({
    required this.sliderImagePath,
    required this.slidertext,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Image.asset(
            sliderImagePath,
            fit: BoxFit.fitWidth,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8.h),
          child: GooglePoppinsWidgets(
            text:slidertext,
            fontsize: 21.h,
            color: cBlack,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}

final List<String> imagesList = [
  'assets/images/main6gopika.jpg',
  'assets/images/mainsanush1.jpg',
  'assets/images/main10vishnu.jpg',
  'assets/images/main13archanaartist.jpg',
];
