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

  Future<void> fectingStudentDetails() async {
    final data = await dataserver
        .collection('StudentProfileCollection')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    studentName.value = await data.data()?['name'];
    phoneNumber.value = await data.data()?['phoneno'];
    log("USER NAme :: ::::::::::::::::::::::::::::::::${studentName.value}");
    log("USER Phone :: ${phoneNumber.value}");
  }

  Future<void> currentStudentDetails() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final email = FirebaseAuth.instance.currentUser!.email!;

    currentUserUid.value = uid;
    currentemail.value = email;
    // log("USER UID :: ${currentUserUid.value}");
    // log("USER E MAil :: ${currentemail.value}");
  }

  @override
  void onInit() {
    fectingStudentDetails();
    super.onInit();
  }
}
