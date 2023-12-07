import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scipro_application/view/colors/colors.dart';

import '../../fonts/google_poppins.dart';

class ButtonContainerWidget extends StatelessWidget {
  final String text;
 

  const ButtonContainerWidget({super.key, required this.text,});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: themeColorBlue,
        borderRadius: BorderRadius.horizontal(),
      ),
      width: 200.w,
      height: 30.h,
      child: Center(
        child: GooglePoppinsWidgets(
          textAlign: TextAlign.center,
          color: cWhite,
          fontWeight: FontWeight.w500,
          text: text,
          fontsize: 12.sp,
        ),
      ),
    );
  }
}


class ColorButtonContainerWidget extends StatelessWidget {
  final String text;
  final Color color;

  const ColorButtonContainerWidget({super.key, required this.text,required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.horizontal(),
      ),
      width: 180.w,
      height: 40.h,
      child: Center(
        child: GooglePoppinsWidgets(
          textAlign: TextAlign.center,
          color: cWhite,
          fontWeight: FontWeight.bold,
          text: text,
          fontsize: 14.sp,
        ),
      ),
    );
  }
}