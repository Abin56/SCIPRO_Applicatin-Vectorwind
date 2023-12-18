import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scipro_application/view/colors/colors.dart';
import 'package:scipro_application/view/core/core.dart';
import 'package:scipro_application/view/fonts/google_monstre.dart';
import 'package:scipro_application/view/fonts/google_poppins.dart';
import 'package:scipro_application/view/pages/studyMaterils/pdf_viewer.dart';

class PDFListScreen extends StatelessWidget {
  final String recCatID;
  final String courseID;
  final String folderID;
  final String folderName;
  const PDFListScreen({
    Key? key,
    required this.recCatID,
    required this.courseID,
    required this.folderID,
    required this.folderName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: cWhite,
        backgroundColor: themeColorBlue,
        title: GoogleMonstserratWidgets(
          text: "$folderName PDF",
          color: cWhite,
          fontsize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SafeArea(
          child: StreamBuilder(
              stream: dataserver
                  .collection("recorded_course")
                  .doc(recCatID)
                  .collection('course')
                  .doc(courseID)
                  .collection('folders')
                  .doc(folderID)
                  .collection('studyMaterial')
                  .orderBy('position', descending: false)
                  .snapshots(),
              builder: (context, snap) {
                if (snap.hasData) {
                  return ListView.separated(
                      itemBuilder: (BuildContext context, int index) {
                        final data = snap.data!.docs[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return PDFViewerScreen(
                                  url: data['pdfUrl'],
                                );
                              },
                            ));
                          },
                          child: AllPDFListContainer(
                            index: index + 1,
                            text: data['pdfName'],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 10,
                        );
                      },
                      itemCount: snap.data!.docs.length);
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              })),
    );
  }
}

class AllPDFListContainer extends StatelessWidget {
  final int index;
  final String text;
  const AllPDFListContainer({
    required this.text,
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0.r),
      child: Container(
        height: 80.h,
        width: 380.w,
        decoration: BoxDecoration(
            color: cWhite,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.r, 4.r),
                  blurRadius: 8.r,
                  spreadRadius: 2.r),
            ]),
        child: Row(children: [
          Container(
            decoration: BoxDecoration(
              color: cBlue.withOpacity(0.5),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.r),
                  topLeft: Radius.circular(10.r)),
            ),
            width: 30.w,
            child: Center(
              child: GoogleMonstserratWidgets(
                text: index.toString(),
                fontsize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0.r, left: 25.r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GooglePoppinsWidgets(
                  text: text,
                  fontsize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 01.r),
                  child: GooglePoppinsWidgets(text: 'PDF', fontsize: 12.sp),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
