import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scipro_application/controller/auth_controller/user_uid.dart';
import 'package:scipro_application/controller/push_notification/push_notification.dart';
import 'package:scipro_application/controller/subscribed_controller/subscribed_controller.dart';
import 'package:scipro_application/view/pages/home/drawer/drawer.dart';
import 'package:scipro_application/view/pages/home/subscribed_button/subscribed_button.dart';
import 'package:scipro_application/view/pages/recorded_course_plan/recorded%20couse%20or%20category/record_category.dart';

import '../../colors/colors.dart';
import '../../fonts/google_poppins.dart';
import 'carosel slider widget/carosel_slider.dart';
import 'popular courses/popular_courses.dart';
import 'recorded courses/recorded_courses.dart';

class SciproHomePage extends StatelessWidget {
  final PushNotificationController pushNotificationController =
      Get.put(PushNotificationController());
  final UserDetailsFecController userDetailsFecController =
      Get.put(UserDetailsFecController());
  final SubScribedController subScribedController =
      Get.put(SubScribedController());
  SciproHomePage({super.key});

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
              padding: EdgeInsets.only(left: 20.r, top: 10.r, right: 20.r),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10.r),
                    child: GooglePoppinsWidgets(
                      text: 'Hello...',
                      fontsize: 19.sp,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.r),
                    child: GooglePoppinsWidgets(
                      text: FirebaseAuth.instance.currentUser!.displayName!,
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
                          onTap: () async {
                            subScribedController.fectingUserisSubscribed(context);
                          },
                          child: SubscribedButton(text: 'SUBSCRIBED COURSES'))),
                  Padding(
                    padding: EdgeInsets.only(top: 20.r, bottom: 20.r),
                    child: const CarouselSliderWidget(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.r),
                    child: const PopularCourses(),
                  ),
                  const RecordedCourses(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RecordCategory()),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 10.r, bottom: 10.r),
                      child: SubscribedButton(text: "EXPLORE COURSES"),
                    ),
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
