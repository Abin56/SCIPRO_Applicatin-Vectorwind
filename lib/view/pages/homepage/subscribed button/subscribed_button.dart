// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../colors/colors.dart';
import '../../../fonts/google_poppins.dart';

class SubscribedButton extends StatelessWidget {
  String text;
   SubscribedButton({super.key,
  required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        border: Border.all(color: themeColorBlue,width: 2.h),
        // color: themeColorBlue,
        borderRadius: BorderRadius.circular(10),
      ),
      width: 400.w,
      height: 50.h,
      child: Center(
        child: GooglePoppinsWidgets(
          textAlign: TextAlign.center,
          color: themeColorBlue,
          fontWeight: FontWeight.w500,
          text: text,
          fontsize: 19.sp,
        ),
      ),
    );
  }
}
