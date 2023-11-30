import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scipro_application/view/colors/colors.dart';
import 'package:scipro_application/view/fonts/google_poppins.dart';

class VideoListingOfCourses extends StatelessWidget {
  const VideoListingOfCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(backgroundColor: themeColorBlue,
      leading:  IconButton(onPressed: (){
        Navigator.pop(context);
      }, icon: const Icon(Icons.arrow_back,color: cWhite,)),
      ),
      body:Stack(
        children: [
          Container(
          height: double.infinity,
          width: double.infinity,
         decoration:  BoxDecoration(gradient: const LinearGradient(
          begin: Alignment.bottomCenter,end: Alignment.topCenter,
          colors: [Color.fromARGB(255, 1, 117, 185), themeColorBlue]),
            color:themeColorBlue,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(60.r),
              bottomRight: Radius.circular(60.r))
              ),
         child: Padding(
           padding:  EdgeInsets.only(top: 5.r,left: 100.r),
           child: GooglePoppinsWidgets(text: "Course Name", fontsize: 35.sp,fontWeight: FontWeight.bold,color: cWhite,),
         )
        ),
        Positioned(
          top: 150.r,
          left: 0.r,
          right: 0.r,
          bottom: 0.r,
          child: Container(
            decoration:  BoxDecoration(
                color:cWhite,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(50.r),topRight: Radius.circular(50.r))),
                child:SingleChildScrollView(
                  child: Column(
                            children: [
                              Padding(
                                padding:  EdgeInsets.only(top: 10.r,left: 12.r,bottom: 15.r),
                                child: GooglePoppinsWidgets(text: "Videos", fontsize: 21.sp,fontWeight: FontWeight.bold, ),
                              ),
                              const VideoListingContainerWidget(text: "Introduction",  text1:"Pfshgddhbvdhg" ,),
                              const VideoListingContainerWidget(text: "Introduction",  text1:"Pfshgddhbvdhg" ,),
                              const VideoListingContainerWidget(text: "Introduction",  text1:"Pfshgddhbvdhg" ,),
                              const VideoListingContainerWidget(text: "Introduction",  text1:"Pfshgddhbvdhg" ,),
                              const VideoListingContainerWidget(text: "Introduction",  text1:"Pfshgddhbvdhg" ,),
                              const VideoListingContainerWidget(text: "Introduction",  text1:"Pfshgddhbvdhg" ,),
                            ],
                           ),
                ) ,
          ),
        ),
        
        ],
      )
    );
  }
}

class VideoListingContainerWidget extends StatelessWidget {
  final String text;
   final String text1;
  const VideoListingContainerWidget({
    required this.text,
     required this.text1,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(8.0.r),
      child: Center(
        child: Container(
          height: 80.h,
          width: 380.w,
          decoration: BoxDecoration(color: cWhite,borderRadius: BorderRadius.circular(10.r),
          boxShadow: [ 
            BoxShadow( color: Colors.grey, 
          offset: Offset(0.r, 4.r), 
          blurRadius: 8.r, 
          spreadRadius: 2.r),
        
        ] ),
          child: Row(children: [
            Container(width: 100.w,color: cBlue,),
            Padding(
              padding: EdgeInsets.only(top:8.0.r,left: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GooglePoppinsWidgets(text: text, fontsize: 16.sp,fontWeight: FontWeight.bold,),
                  Padding(
                    padding: EdgeInsets.only(top: 01.r),
                    child: GooglePoppinsWidgets(text: text1, fontsize: 12.sp),
                  ),
                  
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}