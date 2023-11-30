import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scipro_application/view/colors/colors.dart';
import 'package:scipro_application/view/fonts/google_poppins.dart';
import 'package:scipro_application/view/pages/subscribed_sessions/subscribed_courses/video_listing.dart';

class RecordCourseCategoryList extends StatelessWidget {
  const RecordCourseCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 1, 124, 253),
        title: GooglePoppinsWidgets(
          text: "Your Courses",
          fontsize: 20.sp,
          fontWeight: FontWeight.w600,
          color: cWhite,
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SelectedCourseListingContainer(
              text: "Selected Course",
            ),
            SelectedCourseListingContainer(
              text: "Selected Course",
            ),
            SelectedCourseListingContainer(
              text: "Selected Course",
            ),
            SelectedCourseListingContainer(
              text: "Selected Course",
            )
          ],
        ),
      ),
    );
  }
}

class SelectedCourseListingContainer extends StatelessWidget {
  final String text;
  const SelectedCourseListingContainer({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const VideoListingOfCourses();
        }));
      },
      child: Padding(
        padding: EdgeInsets.all(8.0.r),
        child: Center(
          child: Container(
            height: 170.h,
            width: 390.w,
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    colors: [
                      Color.fromARGB(255, 1, 124, 253),
                      Color.fromARGB(255, 60, 59, 210)
                    ]),
                color: const Color.fromARGB(255, 60, 59, 210),
                borderRadius: BorderRadius.circular(20.r)),
            child: Center(
                child: GooglePoppinsWidgets(
              text: text,
              fontsize: 21.sp,
              fontWeight: FontWeight.bold,
              color: cWhite,
            )),
          ),
        ),
      ),
    );
  }
}