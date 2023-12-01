import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scipro_application/view/pages/home/drawer/drawer.dart';
import 'package:scipro_application/view/pages/home/subscribed%20button/subscribed_button.dart';
import 'package:scipro_application/view/pages/subscribed_sessions/subscribed_courses/record_course_list.dart';

import '../../colors/colors.dart';
import '../../fonts/google_poppins.dart';
import 'carosel slider widget/carosel_slider.dart';
import 'popular courses/popular_courses.dart';
import 'recorded courses/recorded_courses.dart';

class SciproHomePage extends StatelessWidget {
  const SciproHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            width: double.infinity,
            color: cWhite,
            child: Padding(
              padding: EdgeInsets.only(left: 20.w, top: 10.h, right: 20.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: GooglePoppinsWidgets(
                      text: 'Hello...',
                      fontsize: 19.sp,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: GooglePoppinsWidgets(
                      text: 'Nainika v',
                      fontsize: 20.sp,
                      color: cBlack,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                        top: 30.h,
                      ),
                      child: GestureDetector(
                          onTap: () {
                            print("object");
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const RecordCourseCategoryList();
                            }));
                          },
                          child: SubscribedButton(text: 'SUBSCRIBED COURSES'))),
                  Padding(
                    padding: EdgeInsets.only(top: 20.h, bottom: 20),
                    child: const CarouselSliderWidget(),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: PopularCourses(),
                  ),
                  const RecordedCourses(),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                    child: SubscribedButton(text: "EXPLORE COURSES"),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: cWhite,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const MyHeaderDrawer(),
              MyDrawerList(context),
            ],
          ),
        ),
      ),
    );
  }
}
