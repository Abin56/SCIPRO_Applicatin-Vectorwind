import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scipro_application/model/recorded_Course_models/reco_Category.dart';
import 'package:scipro_application/view/colors/colors.dart';
import 'package:scipro_application/view/core/core.dart';
import 'package:scipro_application/view/fonts/google_poppins.dart';
import 'package:scipro_application/view/pages/recorded_course_plan/select_ur_plan.dart';

class RecordCategory extends StatelessWidget {
  const RecordCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: cWhite,
        backgroundColor: const Color.fromARGB(255, 27, 21, 100),
        title: GooglePoppinsWidgets(
          text: "RECORDED COURSES",
          fontsize: 18.r,
          fontWeight: FontWeight.w500,
          color: cWhite,
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 228, 230, 230),
      body: StreamBuilder(
          stream: dataserver.collection("recorded_course").snapshots(),
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
                    final data = RecordedCoursesModel.fromMap(
                        snapshot.data!.docs[index].data());

                    return GestureDetector(
                        onTap: () => Get.to(() => SelectYourPlanPart(
                            docid: data.id, categoryName: data.name)),
                        child: RecordCategoryWidgetContainer(text: data.name));
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox();
                  },
                  itemCount: snapshot.data!.docs.length);
            }
          }),
    );
  }
}

class RecordCategoryWidgetContainer extends StatelessWidget {
  final String text;

  const RecordCategoryWidgetContainer({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0.r),
      child: Container(
        height: 90.h,
        decoration: const BoxDecoration(
          color: cWhite,
        ),
        child: Row(
          children: [
            Container(
              height: double.infinity,
              width: 100.w,
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.2),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "assets/images/SCIPRO.png",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.r),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
