import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scipro_application/view/colors/colors.dart';
import 'package:scipro_application/view/fonts/google_poppins.dart';
import 'package:scipro_application/view/pages/recorded_course_plan/select%20_urplan_clicking.dart';

class SelectYourPlanPart extends StatelessWidget {
  const SelectYourPlanPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color.fromARGB(255, 71, 40, 247),
      toolbarHeight: 50.h,
      title:  Row(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
               IconButton(onPressed: (){
        Navigator.pop(context);
      }, icon:  Icon(Icons.arrow_back,size: 32.sp,color: cWhite,),),
              Padding(
                padding: EdgeInsets.only(left: 10.r),
                child: GooglePoppinsWidgets(
                  text: "Select Your Plan",
                   fontsize: 18.sp,
                   fontWeight: FontWeight.w400,
                   color: cWhite,),
              )
            ],),),
      backgroundColor: const Color.fromARGB(255, 176, 221, 235),
      body:  SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration( 
                color: const Color.fromARGB(255, 71, 40, 247),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(65.r),
                  bottomRight: Radius.circular(65.r)),),
             
              height: 250.h,
            ),
             Center(
              child: Column(
                children: [
                 Padding(
                   padding: EdgeInsets.only(top:15.r,bottom: 15.r),
                   child: GooglePoppinsWidgets(text: "Category Name", fontsize: 28.sp,fontWeight: FontWeight.bold,color: cWhite,),
                 ),
                  const SeletPlanContanierWidget(text: "Course Name",text1: "16 Days",text2: "4000",),
                  const SeletPlanContanierWidget(text: "Course Name",text1: "16 Days",text2: "4000",),
                  const SeletPlanContanierWidget(text: "Course Name",text1: "16 Days",text2: "4000",),
                  const SeletPlanContanierWidget(text: "Course Name",text1: "16 Days",text2: "4000",),
                  const SeletPlanContanierWidget(text: "Course Name",text1: "16 Days",text2: "4000",),
                  const SeletPlanContanierWidget(text: "Course Name",text1: "16 Days",text2: "4000",),
                  const SeletPlanContanierWidget(text: "Course Name",text1: "16 Days",text2: "4000",),

                 
                ],
              ),
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
    required this. text,
    required this .text1,
    required this.text2,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 15.r),
      child: Container(
        height: 130.h,
        width: 380.w,
        decoration: BoxDecoration( 
          color: cWhite,borderRadius: BorderRadius.circular(14.r)),
        child: Padding(
          padding:  EdgeInsets.only(top:8.0.r,bottom: 8.r,left: 14.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 35.h,
                    width: 170.w,
                    decoration: BoxDecoration(
                      color:themeColorBlue,
                      borderRadius: BorderRadius.circular(8.r), ),
                     child: Center(
                      child: GooglePoppinsWidgets(
                        text: text, fontsize: 14.sp,color: cWhite,)),
                  ),
                  const Spacer(),
                   GestureDetector(
                    onTap: (){
                      detailsShowDialogBox(context: context, title: " Course Details", doyouwantActionButton: true);
                    },
                    child: const Icon(Icons.more_vert)),
                ],
              ),
              Padding(
                padding:  EdgeInsets.only(top: 8.r),
                child: Row(
                  children: [
                    GooglePoppinsWidgets(text: "Duration : ", fontsize: 14.sp,fontWeight: FontWeight.w500,),
                     GooglePoppinsWidgets(text: text1, fontsize: 14.sp,fontWeight: FontWeight.w500),
                  ],
                ),
              ),
               Row(
                  children: [GooglePoppinsWidgets(text: "Fee : ", fontsize: 14.sp,fontWeight: FontWeight.w500),
                    GooglePoppinsWidgets(text: text2, fontsize: 14.sp,fontWeight: FontWeight.w500),
                     GooglePoppinsWidgets(text: "(including all taxes)", fontsize: 14.sp,),
                  ],
                ),
            ],
          ),
        ),
       
      ),
    );
  }
}