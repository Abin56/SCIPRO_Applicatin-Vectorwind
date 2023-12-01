import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scipro_application/view/colors/colors.dart';
import 'package:scipro_application/view/constant/constant.validate.dart';
import 'package:scipro_application/view/fonts/google_poppins.dart';
import 'package:scipro_application/view/widgets/textform%20feild%20Widget/textformfeildWidget.dart';

import '../../widgets/button container widget/button_container_widget.dart';
import '../../widgets/icon back button/icon_back_button.dart';
import 'circle_avathar_widget/circleavathar_widget.dart';

class CreateProfile extends StatelessWidget {
   const CreateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar: AppBar(title: Row(
      children: [IconButtonBackWidget(color: cWhite,),
        GooglePoppinsWidgets(fontsize:19.h , text: 'Create Profile ',color: cWhite,),
      ],
    ),backgroundColor: themeColorBlue,),
    body:  Padding(
      padding:  EdgeInsets.only(top: 10.h,left: 10.h,right: 10.h),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(children: [
             const CircleAvatharImageSelectionWidget(),
            TextFormFiledContainerWidget(hintText: 'Enter your name', title: 'Name', width: 400.h,validator: checkFieldEmpty, ),
            TextFormFiledContainerWidget(hintText: 'Enter your adress', title: 'Address', width: 400.h,validator: checkFieldEmpty,),
            TextFormFiledContainerWidget(hintText: 'Enter your email', title: 'Email', width: 400.h,validator: checkFieldEmailIsValid,),
            TextFormFiledContainerWidget(hintText: 'Enter your phone', title: 'Phone No', width: 400.h,validator: checkFieldPhoneNumberIsValid,),
            TextFormFiledContainerWidget(hintText: 'Enter your pincode', title: 'Pincode', width: 400.h,validator: checkFieldEmpty,),
             Padding(
              padding: const EdgeInsets.only(top: 10),
              child: (  ButtonContainerWidget(text: 'Create', width: 400.w, height: 50.h, fontSize: 19.sp, onTap:
               () { 
                if (formKey.currentState!.validate()){}
                },)),
            )
          ],),
        ),
      ),
    ),
    );

  }
}