import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scipro_application/controller/create_profile/create_profile.dart';
import 'package:scipro_application/view/colors/colors.dart';
import 'package:scipro_application/view/constant/const.dart';
import 'package:scipro_application/view/constant/constant.validate.dart';
import 'package:scipro_application/view/fonts/google_poppins.dart';
import 'package:scipro_application/view/pages/home/homepage.dart';
import 'package:scipro_application/view/widgets/button_container_widget/button_container_widget.dart';
import 'package:scipro_application/view/widgets/isLoadin_showDilogue/isaLoading_diloguebox.dart';
import 'package:scipro_application/view/widgets/textform%20feild%20Widget/textformfeildWidget.dart';

import '../../widgets/icon back button/icon_back_button.dart';
import 'circle_avathar_widget/circleavathar_widget.dart';

class CreateProfile extends StatelessWidget {
  final CreateProfileController createProfileController =
      Get.put(CreateProfileController());
  CreateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
            children: [
              IconButtonBackWidget(
                color: cWhite,
              ),
              GooglePoppinsWidgets(
                fontsize: 19.sp,
                text: 'Create Profile ',
                color: cWhite,
              ),
            ],
          ),
          backgroundColor: themeColorBlue,
          automaticallyImplyLeading: false),
      body: Padding(
        padding: EdgeInsets.only(top: 10.r, left: 10.r, right: 10.r),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CircleAvatharImageSelectionWidget(),
                TextFormFiledContainerWidget(
                  controller: createProfileController.studentNameController,
                  hintText: 'Enter your name',
                  title: 'Name',
                  width: 400.h,
                  validator: checkFieldEmpty,
                ),
                TextFormFiledContainerWidget(
                  controller: createProfileController.addressController,
                  hintText: 'Enter your adress',
                  title: 'Address',
                  width: 400.h,
                  validator: checkFieldEmpty,
                ),
                TextFormFiledContainerWidget(
                  controller: createProfileController.phonenoController,
                  hintText: 'Enter your phone',
                  title: 'Phone No',
                  width: 400.h,
                  validator: checkFieldPhoneNumberIsValid,
                  keyboardType: TextInputType.number,
                ),
                TextFormFiledContainerWidget(
                  controller: createProfileController.districtController,
                  hintText: 'Enter your District',
                  title: 'District',
                  width: 400.h,
                  validator: checkFieldEmpty,
                ),
                TextFormFiledContainerWidget(
                  controller: createProfileController.stateController,
                  hintText: 'Enter your State',
                  title: 'State',
                  width: 400.h,
                  validator: checkFieldEmpty,
                ),
                TextFormFiledContainerWidget(
                  controller: createProfileController.pincodeController,
                  hintText: 'Enter your pincode',
                  title: 'Pincode',
                  width: 400.h,
                  validator: checkFieldEmpty,
                  keyboardType: TextInputType.number,
                ),
                Obx(() => createProfileController.pageLoading.value == true
                    ? const LoadingLottieWidget(
                        height: 200,
                        width: double.infinity,
                      )
                    : Padding(
                        padding: EdgeInsets.only(top: 20.r),
                        child: (ButtonContainerWidget(
                          text: 'Create',
                          width: 400.w,
                          height: 50.h,
                          fontSize: 19.sp,
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              if (createProfileController
                                      .studentImagePath.value ==
                                  null) {
                                return showToast(
                                    msg: "Please upload your image");
                              } else {
                                createProfileController.pageLoading.value =
                                    true;

                                createProfileController
                                    .uploadImageFirebaseStore(
                                        createProfileController
                                            .studentImagePath.value!)
                                    .then((value) {
                                  createProfileController
                                      .addStudentDetailsToServer()
                                      .then((value) {
                                    createProfileController.pageLoading.value =
                                        false;
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SciproHomePage()),
                                    );
                                  });
                                });
                              }
                            }
                          },
                        )),
                      ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
