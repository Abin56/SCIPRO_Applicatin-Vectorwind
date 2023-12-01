import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scipro_application/view/colors/colors.dart';
import 'package:scipro_application/view/fonts/google_poppins.dart';

class RecordCategory extends StatelessWidget {
  const RecordCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color.fromARGB(255, 27,21,100),
      title:  Row(
        children: [
          IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back,size: 32.sp,color: cWhite,),),
           GooglePoppinsWidgets(text: "Record Category", fontsize: 25.r,fontWeight: FontWeight.w500,color: cWhite,),
        ],
      ),),
      backgroundColor: const Color.fromARGB(255, 228,230,230),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            RecordCategoryWidgetContainer(text: "Record Category",),
             RecordCategoryWidgetContainer(text: "Record Category",),
              RecordCategoryWidgetContainer(text: "Record Category",),
               RecordCategoryWidgetContainer(text: "Record Category",),
                RecordCategoryWidgetContainer(text: "Record Category",),
                 RecordCategoryWidgetContainer(text: "Record Category",),
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
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100.h,
        width: 400.w,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.r),
        color: cWhite,
        ),
        
        child:   Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(Icons.play_circle_outline_rounded,size: 80.sp,),
              //GoogleMonstserratWidgets(text: "fgs", fontsize: 12),
              Padding(
                padding:  EdgeInsets.all(8.0.r),
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GooglePoppinsWidgets(text: text, fontsize: 20.r,fontWeight: FontWeight.w500,),
                   
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