import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scipro_application/controller/auth_controller/auth_controller.dart';
import 'package:scipro_application/controller/auth_controller/user_uid.dart';
import 'package:scipro_application/view/pages/create%20profile/create_profile.dart';
import 'package:scipro_application/view/pages/google_signing/google_signing.dart';
import 'package:scipro_application/view/pages/home/homepage.dart';
import 'package:scipro_application/view/pages/on_boardingScreen/introduction_screen.dart';

import '../../../utils/shared_preference_class.dart';

class SplashScreen extends StatelessWidget {
 final UserDetailsFecController userDetailsFecController =
      Get.put(UserDetailsFecController());

  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final authController = Get.put(AuthController());
      await SharedPreferenceClass.initSp();

      final isUserCollectionExist =
          await authController.isUserCollectionExist();
      final isOnBoardingScreenViewed = SharedPreferenceClass.getBool(
          SharedPreferenceClass.isOnBoardingScreenViewed);
      final userData = authController.user.value;

      if (userData != null) {
        userDetailsFecController
            .fectingStudentDetails()
            .then((value) => userDetailsFecController.currentStudentDetails());
        if (isUserCollectionExist) {
          Get.to(SciproHomePage());
        } else {
          Get.to(CreateProfile());
        }
      } else {
        if (isOnBoardingScreenViewed) {
          Get.to( GoogleSigninScreen());
        } else {
          Get.to(const OnBoardingPage());
        }
      }
    });
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset("assets/images/SCIPRO.png"),
      ),
    );
  }
}
