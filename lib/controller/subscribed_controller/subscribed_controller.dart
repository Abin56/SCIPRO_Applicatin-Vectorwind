import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:scipro_application/view/constant/const.dart';
import 'package:scipro_application/view/core/core.dart';
import 'package:scipro_application/view/pages/subscribed_sessions/subscribed_courses/record_course_list.dart';

class SubScribedController extends GetxController {
  fectingUserisSubscribed() async {
    log("User UID $FirebaseAuth.instance.currentUser!.uid");
    final server = await dataserver
        .collection('SubscribedStudents')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (server.data() == null) {
      return showToast(msg: "Sorry you are not a subscribed student");
    } else {
      return Get.to(const RecordCourseCategoryList());
    }
  }
}
