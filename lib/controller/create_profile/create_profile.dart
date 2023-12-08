import 'dart:async';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scipro_application/model/create_profile_student/create_profile_model.dart';
import 'package:scipro_application/view/constant/const.dart';
import 'package:scipro_application/view/core/core.dart';

class CreateProfileController extends GetxController {
  RxString imagePATH = ''.obs;
  Rxn<File> studentImagePath = Rxn();

  TextEditingController studentNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phonenoController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  Future uploadImageFirebaseStore(File imageFile) async {
    final imageName = 'image_${DateTime.now()}.jpg';

    String downloadURL = '';
    Reference storageRef =
        dataserverStorage.ref().child('StudentImageCollection/$imageName');
    try {
      final Uint8List imageBytes = await imageFile.readAsBytes();
      await storageRef.putData(imageBytes).whenComplete(() async {
        String url = await storageRef.getDownloadURL();
        downloadURL = url;
        print("URL  :: $downloadURL");
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future getUserImage() async {
    String imageURl = imagePATH.value;
    return imageURl;
  }

  addStudentDetailsToServer(
      Future<R> Function<R>(FutureOr<R> Function(void) onValue,
              {Function? onError})
          then) async {
    final server = dataserver.collection("StudentProfileCollection");
    final studentDetail = StudentProfileCreationModel(
        uid: dataserverUserAuth!.uid,
        name: studentNameController.text.trim(),
        imageUrl: await getUserImage(),
        email: dataserverUserAuth!.email!,
        address: addressController.text.trim(),
        phoneno: phonenoController.text.trim(),
        district: districtController.text.trim(),
        state: stateController.text.trim(),
        pincode: pincodeController.text.trim());
    try {
      server
          .doc(dataserverUserAuth!.uid)
          .set(studentDetail.toMap())
          .then((value) {
        return then;
      });
    } catch (e) {
      return showToast(msg: e.toString());
    }
  }
}
