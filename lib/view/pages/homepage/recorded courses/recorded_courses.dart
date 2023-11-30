// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../colors/colors.dart';
import '../../../fonts/google_poppins.dart';

// ignore: camel_case_types
class RecordedCourses extends StatelessWidget {
  const RecordedCourses({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GooglePoppinsWidgets(
            text: 'Recorded Courses',
            fontsize: 20.sp,
            color: cBlack,
            fontWeight: FontWeight.bold,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.h, right: 10.h, top: 10.h),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.r), // Image border
              child: Container(
                width: double.infinity,
                height: 200.h,
                color: cWhite,
                child: SizedBox.fromSize(
                  size: Size.fromRadius(48.r), // Image radius
                  child: Image.asset('assets/images/gopik_language.JPG',
                      fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: GooglePoppinsWidgets(
              text: 'Features',
              fontsize: 20.sp,
              color: themeColorBlue,
            ),
          ),
          FeatureTextWidget(
            fetureText: 'Recorded Vedios with class room tools',
          ),
          FeatureTextWidget(
            fetureText: '3 Months Duration',
          ),
          FeatureTextWidget(
            fetureText: 'Teachers Support',
          ),
          FeatureTextWidget(
            fetureText: 'Malayalam and english',
          ),
          FeatureTextWidget(
            fetureText: 'Free study Materials',
          ),
        ],
      ),
    );
  }
}

class FeatureTextWidget extends StatelessWidget {
  String fetureText;
  FeatureTextWidget({
    super.key,
    required this.fetureText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: ListTile(
          leading: const Icon(Icons.table_rows_sharp),
          title: GooglePoppinsWidgets(
            text: fetureText,
            fontsize: 15.sp,
            fontWeight: FontWeight.w600,
            color: cGrey,
          ),
        ))
      ],
    );
  }
}
