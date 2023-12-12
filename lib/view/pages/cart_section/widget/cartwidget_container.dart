import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scipro_application/view/colors/colors.dart';
import 'package:scipro_application/view/fonts/google_poppins.dart';

class CartWidgetContainer extends StatelessWidget {
  final double height;
  final String text;
  final List<Widget> children;
  const CartWidgetContainer({
    required this.height,
    required this.text,
    required this.children,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0.r),
      child: Column(
        children: [
          Container(
            height: height,
            decoration: BoxDecoration(
                color: cWhite, borderRadius: BorderRadius.circular(05.r)),
            child: Column(
              children: [
                Container(
                  height: 40.h,
                  decoration: BoxDecoration(
                      gradient: myGradient,
                      color: const Color.fromARGB(255, 46, 48, 214),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(05.r),
                          topRight: Radius.circular(05.r))),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: GooglePoppinsWidgets(
                          text: text,
                          fontsize: 16.sp,
                          color: cWhite,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: children,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

const LinearGradient myGradient = LinearGradient(
  begin: Alignment.centerLeft,
  colors: [
    Color.fromARGB(255, 46, 48, 214),
    Color.fromARGB(255, 106, 17, 214),
  ],
);
