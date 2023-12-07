import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scipro_application/view/colors/colors.dart';
import 'package:scipro_application/view/fonts/google_poppins.dart';
import 'package:scipro_application/view/pages/recorded_course_plan/select_ur_plan.dart';

class RecordCategory extends StatelessWidget {
  const RecordCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color.fromARGB(255, 27,21,100),
      leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: cWhite,
              )),
      title:  Padding(
        padding: EdgeInsets.only(left: 10.r),
        child: GooglePoppinsWidgets(text: "Course Category", fontsize: 18.r,fontWeight: FontWeight.w500,color: cWhite,),
      ),),
      backgroundColor: const Color.fromARGB(255, 228,230,230),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            RecordCategoryWidgetContainer(text: "Science",),
             RecordCategoryWidgetContainer(text:"Science",),
              RecordCategoryWidgetContainer(text: "Science",),
               RecordCategoryWidgetContainer(text: "Science",),
                RecordCategoryWidgetContainer(text: "Science",),
                 RecordCategoryWidgetContainer(text: "Science",),
          ],
        ),
      ),
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
      padding:  EdgeInsets.all(8.0.r),
      child: GestureDetector(
        onTap: (){
           Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const SelectYourPlanPart();
        }));
        },
        child: Container(
          height: 100.h,
          width: 400.w,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.r),
          color: cWhite,
          ),
          
          child:   Row(
            children: [
              Container(
                height: double.infinity,
                width: 100.w,
                decoration: BoxDecoration( color: Colors.red.withOpacity(0.2),borderRadius:  BorderRadius.only(topLeft: Radius.circular(12.r),bottomLeft: Radius.circular(12.r))),
               
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset("assets/images/SCIPRO.png",),
                  ) ,
              ),
             
              Padding(
                padding:   EdgeInsets.only(left: 20.r),
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
               
                  children: [
                    Text( text, style:  TextStyle(fontSize: 22.sp,fontWeight: FontWeight.bold,), ),
                   
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