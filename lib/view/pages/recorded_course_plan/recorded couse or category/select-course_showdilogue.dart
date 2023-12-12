import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scipro_application/view/colors/colors.dart';
import 'package:scipro_application/view/fonts/google_poppins.dart';
import 'package:scipro_application/view/pages/cart_section/cart.dart';
import 'package:scipro_application/view/widgets/custom_showDilog/custom_showdilog.dart';

showCourseDetails(BuildContext context, String category, String course,
    String faculity, num price, num duration, num timestap,String courseID,String categoryid) {
  int nums = timestap as int;

  DateTime date = DateTime.fromMicrosecondsSinceEpoch(nums * 1000);
  String getdate = DateFormat("MM-MMM-yyyy").format(date);
  String getTime = DateFormat("hh:mm a").format(date);

  return customShowDilogBox(
      context: context,
      title: "Course Details",
      children: [
        SizedBox(
          height: 400,
          width: 800,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 12.r),
                child: Container(
                  color: Colors.lightBlue,
                  height: 80.h,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(top: 12.r, left: 8.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GooglePoppinsWidgets(
                          text: category,
                          fontsize: 20.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 06),
                          child: GooglePoppinsWidgets(
                              text: "SciPRo Record Course", fontsize: 13.sp),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              DetailsOfCourseContainerWidget(
                  text: "Course Title", text1: course, color: cWhite),
              DetailsOfCourseContainerWidget(
                text: "Faculity",
                text1: faculity,
                color: const Color.fromARGB(255, 125, 208, 247),
              ),
              DetailsOfCourseContainerWidget(
                  text: "Course Fee", text1: '$price /-', color: cWhite),
              DetailsOfCourseContainerWidget(
                text: "Duration",
                text1: '$duration days',
                color: const Color.fromARGB(255, 125, 208, 247),
              ),
              DetailsOfCourseContainerWidget(
                text: "Posted Date",
                text1: getdate,
                color: const Color.fromARGB(255, 125, 208, 247),
              ),
              DetailsOfCourseContainerWidget(
                  text: "Posted Time", text1: getTime, color: cWhite),
            ],
          ),
        )
      ],
      actiononTapfuction: () {
        Get.to(() => CartSectionDesign(
          categoryid:categoryid ,
          duration: duration.toInt(),
          courseID: courseID,
              category: category,
              course: course,
              courseprice: price,
            ));
      },
      actiontext: 'SUBSCRIBE🔔',
      doyouwantActionButton: true);
}

class DetailsOfCourseContainerWidget extends StatelessWidget {
  final String text;
  final String text1;
  final Color color;
  const DetailsOfCourseContainerWidget({
    required this.text,
    required this.text1,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.r),
      child: Container(
        color: color,
        height: 40.h,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(left: 8.r, right: 8.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GooglePoppinsWidgets(
                text: text,
                fontsize: 12.sp,
              ),
              GooglePoppinsWidgets(
                text: text1,
                fontsize: 12.sp,
                fontWeight: FontWeight.bold,
              )
            ],
          ),
        ),
      ),
    );
  }
}
