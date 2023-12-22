// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scipro_application/view/colors/colors.dart';
import 'package:scipro_application/view/core/core.dart';
import 'package:scipro_application/view/fonts/google_monstre.dart';
import 'package:scipro_application/view/fonts/google_poppins.dart';
import 'package:scipro_application/view/pages/studyMaterils/list_materilas.dart';
import 'package:scipro_application/view/pages/subscribed_sessions/video_player/sample.dart';

class RecordedVideoList extends StatelessWidget {
  final String recCatID;
  final String courseID;
  final String folderID;
  final String folderName;
  const RecordedVideoList({
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
          text: "$folderName videos",
          color: cWhite,
          fontsize: 12.sp,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 20.r),
            child: GestureDetector(
              onTap: () {
                Get.to(() => PDFListScreen(
                    recCatID: recCatID,
                    courseID: courseID,
                    folderID: folderID,
                    folderName: folderName));
              },
              child: Container(
                color: cWhite.withOpacity(0.2),
                height: 40.h,
                width: 200.w,
                child: Center(
                  child: GooglePoppinsWidgets(
                    text: "STUDY MATERIALS",
                    fontsize: 14.sp,
                    color: cWhite,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
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
                  .collection('videos')
                  .orderBy('position', descending: false)
                  .snapshots(),
              builder: (context, snap) {
                if (snap.hasData) {
                  return ListView.separated(
                      itemBuilder: (BuildContext context, int index) {
                        final data = snap.data!.docs[index];
                        return GestureDetector(
                          onTap: () {
                            // Get.off(() => SampleVideoPLayer(
                            //       videourl: data['videoUrl'],
                            //     ));
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return SampleVideoPLayer(
                                  videourl: data['videoUrl'],
                                );
                              },
                            ));
                          },
                          child: AllVideoListContainer(
                            imageurl: data['thumbnailUrl'],
                            index: index + 1,
                            text: data['videoName'],
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

class AllVideoListContainer extends StatelessWidget {
  final int index;
  final String text;
  final String imageurl;
  const AllVideoListContainer({
    required this.text,
    super.key,
    required this.index,
    required this.imageurl,
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
          SizedBox(
            width: 100.w,
            child: Image.network(imageurl),
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
                  child: GooglePoppinsWidgets(text: 'Video', fontsize: 12.sp),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
