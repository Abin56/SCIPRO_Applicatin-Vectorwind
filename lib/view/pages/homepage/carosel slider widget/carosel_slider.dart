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
          
              slidertext: 'SCIPRO LANGUAGE COURSES',
            ),
            CaroselmageWidget(
              sliderImagePath: imagesList[1],
              slidertext: 'ONLINE COURSES',
            ),
            CaroselmageWidget(
              sliderImagePath: imagesList[2],
              slidertext: 'RECORDED COURSES',
            ),
            CaroselmageWidget(
              sliderImagePath: imagesList[3],
              slidertext: 'SCIPRO SKILLS',
            ),
          ],
          options: CarouselOptions(
            height: 270.w,
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
          padding:  EdgeInsets.only(bottom: 20.h),
          child: GooglePoppinsWidgets(
            text:slidertext,
            fontsize: 19.h,
            color: cBlack,
            fontWeight: FontWeight.w600,
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
