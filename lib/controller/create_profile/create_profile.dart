import 'dart:async';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scipro_application/model/create_profile_student/create_profile_model.dart';
import 'package:scipro_application/view/constant/const.dart';
import 'package:scipro_application/view/constant/constant.validate.dart';
import 'package:scipro_application/view/core/core.dart';

class CreateProfileController extends GetxController {
  RxBool pageLoading = false.obs;
  RxString imagePATH = ''.obs;
  Rxn<File> studentImagePath = Rxn();
  String downloadURL = '';

  TextEditingController studentNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phonenoController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  Future uploadImageFirebaseStore(File imageFile) async {
    final imageName = 'image_${DateTime.now()}.jpg';

    Reference storageRef =
        dataserverStorage.ref().child('StudentImageCollection/$imageName');
    try {
      final Uint8List imageBytes = await imageFile.readAsBytes();
      await storageRef.putData(imageBytes).whenComplete(() async {
        String url = await storageRef.getDownloadURL();
        downloadURL = url;
        if (kDebugMode) {
          print("URL  :: $downloadURL");
        }
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> addStudentDetailsToServer() async {
    final studentID = getRandomString(10).toString();
    final server = dataserver.collection("StudentProfileCollection");
    final studentDetail = StudentProfileCreationModel(
        studentid: studentID,
        uid: studentID,
        name: studentNameController.text.trim(),
        imageUrl: downloadURL,
        email: 'abinjohn8089@gmail.com',
        address: addressController.text.trim(),
        phoneno: phonenoController.text.trim(),
        district: districtController.text.trim(),
        state: stateController.text.trim(),
        pincode: pincodeController.text.trim());
    try {
      server.doc(studentID).set(studentDetail.toMap()).then((value) {
        return showToast(msg: 'Profile Created Sucessfully');
      });
    } catch (e) {
      return showToast(msg: e.toString());
    }
  }
}