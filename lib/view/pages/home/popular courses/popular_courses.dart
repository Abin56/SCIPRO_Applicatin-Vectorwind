import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scipro_application/view/colors/colors.dart';

import '../../../fonts/google_poppins.dart';

class PopularCourses extends StatelessWidget {
  const PopularCourses({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GooglePoppinsWidgets(
          text: "Popular Courses",
          fontsize: 20.sp,
          color: cBlack,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(
          height: 400.h,
          width: 400.w,
          child: GridView.count(
            padding: EdgeInsets.all(8.r),
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            children: List.generate(
              popularCourseImages.length,
              (index) => GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: cWhite,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  height: 250.h,

                  // ignore: sort_child_properties_last
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 169.w,
                              height: 120.h,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.r),
                                    topRight:
                                        Radius.circular(10.r)), // Image border
                                child: SizedBox.fromSize(
                                  size: Size.fromRadius(48.r), // Image radius
                                  child: Image.asset(popularCourseImages[index],
                                      fit: BoxFit.cover),
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top: 6.r),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: GooglePoppinsWidgets(
                                text: popularText[index],
                                fontsize: 13.sp,
                                color: cBlack,
                                textAlign: TextAlign.center,
                                fontWeight: FontWeight.w500
                                
                                ,
                              ))
                            ],
                          ),
                        )
                      ]),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

List<String> popularCourseImages = [
  'assets/images/main15archana.jpg',
  'assets/images/main2ancy.jpg',
  'assets/images/main6akhilmon.jpg',
  'assets/images/mainexam1.jpg',
  'assets/images/main8sara.jpg',
  'assets/images/main10vishnu.jpg',
  'assets/images/main12nandhana.jpg',
  'assets/images/examwriting.jpg',
  'assets/images/main13archanaartist.jpg',
  'assets/images/mainsanush1.jpg',
  

];

List<String> popularText = [
  'KPSC EXAMS',
  'CSIR-NET LIFESCIENCES',
  'UGC-NET ENVIRONMENTAL SCIENCE',
  'GATE EXAMS',
  'ICAR-NET',
  'ICMR-JRF',
  'DBT-JRF',
  'SET EXAMS',
  'CUET-PG',
  'SCIPRO SKILLS',
  
];
