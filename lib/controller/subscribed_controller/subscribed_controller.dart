import 'package:get/get.dart';
import 'package:scipro_application/controller/auth_controller/user_uid.dart';
import 'package:scipro_application/view/colors/colors.dart';
import 'package:scipro_application/view/core/core.dart';
import 'package:scipro_application/view/pages/subscribed_sessions/subscribed_courses/record_course_list.dart';
import 'package:scipro_application/view/pages/subscribed_sessions/subscribed_courses/video_listing.dart';

class SubScribedController extends GetxController {
  fectingUserisSubscribed() async {
    // log("User UID $FirebaseAuth.instance.currentUser!.uid");
    final server = await dataserver
        .collection('SubscribedStudents')
        .doc(Get.find<UserDetailsFecController>().currentUserUid.value)
        .get();
    if (server.data() == null) {
      return Get.snackbar('Message', 'Sorry you are not subscribed ',
          backgroundColor: cWhite);
    } else {
      return Get.to(RecordCourseCategoryList());
    }
  }

  checkExpiryDate({
    required DateTime exdate,
    required String courseID,
    required String coursecategoryid,
    required String coursename,
    required String courseid,
  }) async {
    if (exdate.isBefore(DateTime.now())) {
      await dataserver
          .collection('SubscribedStudents')
          .doc(Get.find<UserDetailsFecController>().currentUserUid.value)
          .collection('PurchasedCourses')
          .doc(courseID)
          .update({'dective': true});
      return Get.snackbar("Message", "Subscription Expired",
          backgroundColor: cWhite);
    } else {
      return Get.to(() => VideoListingOfCourses(
            categoryID: coursecategoryid,
            courseName: coursename,
            courseID: courseid,
          ));
    }
  }
}
