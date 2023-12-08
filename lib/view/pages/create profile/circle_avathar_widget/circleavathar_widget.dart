import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scipro_application/controller/create_profile/create_profile.dart';
import 'package:scipro_application/view/colors/colors.dart';
import 'package:scipro_application/view/fonts/google_poppins.dart';

// ignore: must_be_immutable
class CircleAvatharImageSelectionWidget extends StatelessWidget {
  bool isImageSelected = false;

  File? imageFile;
  CreateProfileController createProfileController =
      Get.put(CreateProfileController());
  CircleAvatharImageSelectionWidget({
    super.key,
  });

  pickImagefromGallery() async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        imageFile = File(pickedImage.path);
        isImageSelected = true;
        createProfileController.studentImagePath.value = imageFile;
        if (kDebugMode) {
          print(
              "Image path  ${createProfileController.studentImagePath.value}");
        }
      } else {
        if (kDebugMode) {
          print('User didnt pick any image.');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  pickImagefromCamera() async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (pickedImage != null) {
        imageFile = File(pickedImage.path);
        isImageSelected = true;
        createProfileController.studentImagePath.value = imageFile;
        if (kDebugMode) {
          print(
              "Image path  ${createProfileController.studentImagePath.value}");
        }
      } else {
        if (kDebugMode) {
          print('User didnt pick any image.');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() {
          if (createProfileController.studentImagePath.value == null) {
            return CircleAvatar(
              radius: 70.r,
              child: Stack(
                children: [
                  InkWell(
                    onTap: () async {},
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: CircleAvatar(
                        radius: 20.r,
                        backgroundColor: const Color.fromARGB(255, 52, 50, 50),
                        child: IconButton(
                          icon: const Icon(Icons.camera_alt_outlined),
                          color: Colors.white,
                          onPressed: () async {
                            getbottomSheetForPickIMage(context);
                            ();
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Column(
              children: [
                CircleAvatar(
                  radius: 85.r,
                  backgroundImage: FileImage(
                      createProfileController.studentImagePath.value!),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.r),
                  child: GestureDetector(
                    onTap: () {
                      createProfileController.uploadImageFirebaseStore(
                          createProfileController.studentImagePath.value!);
                      // createProfileController.studentImagePath.value = null;
                    },
                    child: Container(
                      color: themeColorBlue,
                      height: 35.h,
                      width: 130.w,
                      child: Center(
                        child: GooglePoppinsWidgets(
                          text: "CHANGE",
                          fontsize: 12.sp,
                          color: cWhite,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        })
      ],
    );
  }

  Future<void> getbottomSheetForPickIMage(context) async {
    return showModalBottomSheet(
        context: context,
        builder: (builder) {
          return SizedBox(
            height: 150.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () {
                          pickImagefromGallery();
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.photo_size_select_actual_outlined,
                          size: 45,
                        )),
                    const SizedBox(
                      width: 2,
                    ),
                    IconButton(
                        onPressed: () {
                          pickImagefromCamera();
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.photo_camera_outlined,
                          size: 45,
                        )),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Gallery",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Camera",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
