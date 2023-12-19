import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scipro_application/model/recorded_Course_models/rec_courses-model.dart';
import 'package:scipro_application/view/colors/colors.dart';
import 'package:scipro_application/view/core/core.dart';
import 'package:scipro_application/view/fonts/google_poppins.dart';
import 'package:scipro_application/view/pages/recorded_course_plan/recorded%20couse%20or%20category/select-course_showdilogue.dart';

class SelectYourPlanPart extends StatelessWidget {
  final String docid;
  final String categoryName;
  const SelectYourPlanPart(
      {super.key, required this.docid, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: cWhite,
        backgroundColor: const Color.fromARGB(255, 71, 40, 247),
        toolbarHeight: 50.h,
        title: Padding(
          padding: EdgeInsets.only(left: 10.h, top: 12.h),
          child: GooglePoppinsWidgets(
            text: "SELECT COURSES",
            fontsize: 20.sp,
            fontWeight: FontWeight.bold,
            color: cWhite,
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 71, 40, 247),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 71, 40, 247),
              ),
              height: 250.h,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 15.r, bottom: 15.r),
                  child: Text(
                    categoryName,
                    style: TextStyle(
                        fontSize: 26.sp,
                        fontWeight: FontWeight.bold,
                        color: cWhite),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: SizedBox(
                    height: 850,
                    child: StreamBuilder(
                        stream: dataserver
                            .collection("recorded_course")
                            .doc(docid)
                            .collection('course')
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.data == null) {
                            return Center(
                              child: GooglePoppinsWidgets(
                                text: "No course found",
                                fontsize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          } else {
                            return ListView.separated(
                                itemBuilder: (BuildContext context, int index) {
                                  final data = RecCategoryCoursesModel.fromMap(
                                      snapshot.data!.docs[index].data());

                                  return GestureDetector(
                                    onTap: () => showCourseDetails(
                                        context,
                                        categoryName,
                                        data.courseName,
                                        data.facultyName,
                                        data.courseFee,
                                        data.duration,
                                        data.createdDate,
                                        data.id,
                                        data.categoryId
                                        ),
                                    child: SeletPlanContanierWidget(
                                        text: data.courseName,
                                        text1: data.duration.toString(),
                                        text2: data.courseFee.toString()),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return const SizedBox();
                                },
                                itemCount: snapshot.data!.docs.length);
                          }
                        }),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SeletPlanContanierWidget extends StatelessWidget {
  final String text;
  final String text1;
  final String text2;
  const SeletPlanContanierWidget({
    required this.text,
    required this.text1,
    required this.text2,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
 
      child: Padding(
        padding: EdgeInsets.only(top: 15.r),
        child: Container(
          height: 160.h,
          width: 380.w,
          decoration: const BoxDecoration(
            color: cWhite,
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 8.0.r, bottom: 8.r, left: 14.r,right: 14.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 45.h,
                      
                        decoration: BoxDecoration(
                          color: themeColorBlue,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Center(
                            child: GooglePoppinsWidgets(
                          text: text,
                          fontsize: 17.sp,
                          color: cWhite,
                          fontWeight: FontWeight.w500,
                        )),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: Row(
                    children: [
                      GooglePoppinsWidgets(
                        text: "Duration :  ",
                        fontsize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      GooglePoppinsWidgets(
                          text: "$text1 days",
                          fontsize: 14.sp,
                          fontWeight: FontWeight.bold),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: Row(
                    children: [
                      GooglePoppinsWidgets(
                          text: "Price        :  ",
                          fontsize: 12.sp,
                          fontWeight: FontWeight.w500),
                      GooglePoppinsWidgets(
                          text: "$text2 / -",
                          fontsize: 16.sp,
                          fontWeight: FontWeight.bold),
                      GooglePoppinsWidgets(
                        text: " (including all taxes)",
                        fontsize: 14.sp,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
