import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:scipro_application/view/core/core.dart';

class UserDetailsFecController extends GetxController {
  RxString currentuid = ''.obs;
  RxString studentName = ''.obs;
  RxString phoneNumber = ''.obs;
  RxString currentUserUid = ''.obs;
  RxString currentemail = ''.obs;

  @override
  void onInit() {
    currentuid.value = FirebaseAuth.instance.currentUser!.uid;
    currentemail.value = FirebaseAuth.instance.currentUser!.uid;
    fectingStudentDetails();
    super.onInit();
    log("USER UID :: ${currentUserUid.value}");
    log("USER E MAil :: ${currentUserUid.value}");
  }

  Future<void> fectingStudentDetails() async {
    final data = await dataserver
        .collection('StudentProfileCollection')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    studentName.value = await data.data()?['name'];
    phoneNumber.value = await data.data()?['phoneno'];

    // log("Student Details : ${StudentDetails.studentname}");
    // // log("From GETX : $FirebaseAuth.instance.currentUser!.uid");
    // log("Student Details : ${StudentDetails.phoneNumber}");
  }
}
