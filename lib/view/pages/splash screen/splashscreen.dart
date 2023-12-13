import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scipro_application/controller/auth_controller/auth_controller.dart';
import 'package:scipro_application/controller/push_notification/push_notification.dart';
import 'package:scipro_application/view/pages/google_signing/google_signing.dart';
import 'package:scipro_application/view/pages/home/homepage.dart';
import 'package:scipro_application/view/pages/on_boardingScreen/introduction_screen.dart';

import '../../../utils/shared_preference_class.dart';

class SplashScreen extends StatelessWidget {
  final PushNotificationController pushNotificationController =
      Get.put(PushNotificationController());
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
 

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final authController = Get.put(AuthController());
      await SharedPreferenceClass.initSp();
      if (SharedPreferenceClass.getBool(
              SharedPreferenceClass.isOnBoardingScreenViewed) &&
          authController.user.value != null) {
        Get.offAll(() => const SciproHomePage());
      } else if (!SharedPreferenceClass.getBool(
          SharedPreferenceClass.isOnBoardingScreenViewed)) {
        Get.offAll(() => const OnBoardingPage());
      } else {
        Get.offAll(() => const GoogleSigninScreen());
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
