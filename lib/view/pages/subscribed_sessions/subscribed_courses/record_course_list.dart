import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scipro_application/controller/auth_controller/user_uid.dart';
import 'package:scipro_application/controller/invoice_controller/invoice_controller.dart';
import 'package:scipro_application/controller/subscribed_controller/subscribed_controller.dart';
import 'package:scipro_application/view/colors/colors.dart';
import 'package:scipro_application/view/constant/constant.validate.dart';
import 'package:scipro_application/view/core/core.dart';
import 'package:scipro_application/view/fonts/google_poppins.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class RecordCourseCategoryList extends StatelessWidget {
  final GetInvoiceController getinvoicecontroller =
      Get.put(GetInvoiceController());
  RecordCourseCategoryList({super.key});

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
      body: StreamBuilder(
        stream: dataserver
            .collection("SubscribedStudents")
            .doc(Get.find<UserDetailsFecController>().currentUserUid.value)
            .collection('PurchasedCourses')
            .orderBy('joindate', descending: false)
            .snapshots(),
        builder: (context, snaps) {
          if (snaps.hasData) {
            return ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  final data = snaps.data!.docs[index];
                  return GestureDetector(
                    onTap: () async {
                      Get.find<SubScribedController>().checkExpiryDate(
                          coursecategoryid: data['coursecategoryid'],
                          courseid: data['courseid'],
                          coursename: data['coursename'],
                          exdate: DateTime.parse(data['expirydate']),
                          courseID: data['docid']);
                    },
                    child: SelectedCourseListingContainer(
                      exdate: data['expirydate'],
                      text: data['coursename'],
                      getinvoiceonTap: () async {
                        return _createPdf();
                      },
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox();
                },
                itemCount: snaps.data!.docs.length);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class SelectedCourseListingContainer extends StatelessWidget {
  final String text;
  final String exdate;
  final void Function()? getinvoiceonTap;
  const SelectedCourseListingContainer({
    required this.getinvoiceonTap,
    required this.text,
    super.key,
    required this.exdate,
  });

  @override
  Widget build(BuildContext context) {
    log(DateTime.now().toString());
    return Padding(
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
          child: Column(
            children: [
              DateTime.parse(exdate).isBefore(DateTime.now())
                  ? Row(
                      children: [
                        Container(
                          height: 30.h,
                          width: 120.w,
                          color: Colors.red.withOpacity(0.8),
                          child: Center(
                            child: GooglePoppinsWidgets(
                              text: "EXPIRED",
                              fontsize: 11.sp,
                              color: cWhite,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    )
                  : const Text(''),
              Padding(
                padding: EdgeInsets.only(top: 40.r),
                child: GooglePoppinsWidgets(
                  text: text,
                  fontsize: 21.sp,
                  fontWeight: FontWeight.bold,
                  color: cWhite,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // GestureDetector(
                    //   onTap: getinvoiceonTap,
                    //   child: Container(
                    //     color: cWhite.withOpacity(0.2),
                    //     height: 35.h,
                    //     width: 80.w,
                    //     child: GooglePoppinsWidgets(
                    //       text: " Get Invoice",
                    //       fontsize: 11.sp,
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    // ),
                    const Spacer(),
                    Container(
                      color: cWhite.withOpacity(0.2),
                      height: 40.h,
                      width: 200.w,
                      child: Row(
                        children: [
                          GooglePoppinsWidgets(
                            text: "   Expiry date :  ",
                            fontsize: 11.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          GooglePoppinsWidgets(
                            text: dateConveter(DateTime.parse(exdate)),
                            fontsize: 10.sp,
                            color: cWhite,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _createPdf() async {
  // Create a PDF document
  final PdfDocument document = PdfDocument();

  // Add a page to the document
  final PdfPage page = document.pages.add();

  // Draw text on the page
  final PdfGraphics graphics = page.graphics;
  graphics.drawString(
      'Hello, Syncfusion PDF!', PdfStandardFont(PdfFontFamily.helvetica, 20),
      brush: PdfSolidBrush(PdfColor(0, 0, 0)),
      bounds: const Rect.fromLTWH(10, 10, 200, 20));

  // Save the document to a file
  // final List<int> bytes = document.save();
  document.dispose();

  // Display or save the PDF as needed
  // For example, you can save it to a file or display it in a PDF viewer
}
