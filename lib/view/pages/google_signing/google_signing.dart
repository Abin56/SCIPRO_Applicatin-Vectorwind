import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scipro_application/controller/auth_controller/auth_controller.dart';
import 'package:scipro_application/controller/auth_controller/user_uid.dart';
import 'package:scipro_application/view/colors/colors.dart';
import 'package:scipro_application/view/fonts/google_poppins.dart';
import 'package:scipro_application/view/pages/create%20profile/create_profile.dart';
import 'package:scipro_application/view/pages/home/homepage.dart';

import '../../../utils/shared_preference_class.dart';

class GoogleSigninScreen extends StatelessWidget {
  final userDetailController = Get.put(UserDetailsFecController());

   GoogleSigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      SharedPreferenceClass.setBool(
          SharedPreferenceClass.isOnBoardingScreenViewed, true);
    });
    return Scaffold(
      backgroundColor: cWhite,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(
          top: 180.r,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 250.w,
              height: 50.h,
              color: themeColorBlue.withOpacity(0.8),
              child: Center(
                child: GooglePoppinsWidgets(
                  text: "WELCOME  TO",
                  fontsize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: cWhite,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.r),
              child: SizedBox(
                height: 300.h,
                width: double.infinity,
                child: Image.asset('assets/images/SCIPRO.png'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.r),
              child: Center(
                child: SizedBox(
                  height: 52.h,
                  width: 280.w,
                  child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(cWhite)),
                      onPressed: () async {
                        await Get.find<AuthController>().signInWithGoogle();
                        await Get.find<AuthController>().checkSignIn();
                        final isUserCollectionExist =
                            await Get.find<AuthController>()
                                .isUserCollectionExist();
                        if (Get.find<AuthController>().user.value != null) {
                          if (isUserCollectionExist) {
                             await userDetailController.fectingStudentDetails();
                            Get.offAll(() => SciproHomePage());
                          } else {
                            Get.offAll(() => CreateProfile());
                          }
                        } else {
                          Get.offAll(() =>  GoogleSigninScreen());
                        }

                        //Get.to(const OnBoardingPage());
                      },
                      child: Padding(
                        padding: EdgeInsets.all(10.r),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 35.h,
                              width: 35.w,
                              child: Image.asset('assets/png/google_png.png'),
                            ),
                            const Text("   Sign in with Google"),
                          ],
                        ),
                      )),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
