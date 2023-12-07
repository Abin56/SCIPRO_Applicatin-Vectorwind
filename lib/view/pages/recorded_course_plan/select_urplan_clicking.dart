import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scipro_application/view/colors/colors.dart';
import 'package:scipro_application/view/fonts/google_poppins.dart';
import 'package:scipro_application/view/widgets/back_container/back_container.dart';
import 'package:scipro_application/view/widgets/button_container_widget/button_container_widget.dart';


detailsShowDialogBox(
    {required BuildContext context,
    required String title,
    //required List<Widget> children,
    String? actiontext,
    required bool doyouwantActionButton,
    void Function()? actiononTapfuction}) {
  return showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.r)
        ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GooglePoppinsWidgets(
                  text: title, fontsize: 13.sp, fontWeight: FontWeight.w600),
               Padding(
                padding: EdgeInsets.only(top: 10.r),
                child: const BackButtonContainerWidget(),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                SizedBox(
                  height: 600.h,
                  child: Column(
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(bottom: 12.r),
                        child: Container(
                          color: Colors.lightBlue,
                          height: 80.h,
                          width: double.infinity,
                          child: Padding(
                            padding:  EdgeInsets.only(top: 12.r,left: 8.r),
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                    GooglePoppinsWidgets(text: "Physics", fontsize: 16.sp,fontWeight: FontWeight.w500,),
                                                GooglePoppinsWidgets(text: "SciPRo Record Course", fontsize: 13.sp)
                              ],
                            ),
                          ),
                        ),
                      ),
                      
                      const DetailsOfCourseContainerWidget(text: "Course Title",text1: "anm",color:   cWhite),
                      const DetailsOfCourseContainerWidget(text: "Faculity",text1: "Fgdfg",color:  Color.fromARGB(255, 125, 208, 247),),
                      const DetailsOfCourseContainerWidget(text: "Course Fee",text1: "8900",color: cWhite),
                      const DetailsOfCourseContainerWidget(text: "Duration",text1: "5",color:Color.fromARGB(255, 125, 208, 247),),
                      const DetailsOfCourseContainerWidget(text: "Course ID",text1: "uj68",color:  cWhite),
                      const DetailsOfCourseContainerWidget(text: "Posted Date",text1: "23/4/23",color:Color.fromARGB(255, 125, 208, 247), ),
                      const DetailsOfCourseContainerWidget(text: "Posted Time",text1: "6:00",color: cWhite),
                        
                     
                    ],
                  ),
                )
              ]
            ),
          ),
          actions: doyouwantActionButton == true
              ? <Widget>[
                  GestureDetector(
                    onTap: (){
                     
                    },
                     child: const ColorButtonContainerWidget(text: "SUBSCRIBE🔔", color: themeColorBlue)
                  ),
                ]
              : null);
    },
  );
}

class DetailsOfCourseContainerWidget extends StatelessWidget {
  final String text;
   final String text1;
   final Color color;
  const DetailsOfCourseContainerWidget({
    required this.text,
    required this.text1,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 5.r),
      child: Container(
        color:color,
        height: 40.h,
        width: double.infinity,
        child: Padding(
          padding:  EdgeInsets.only(left: 8.r,right: 8.r),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                  GooglePoppinsWidgets(text: text, fontsize: 12.sp,),
                              GooglePoppinsWidgets(text: text1, fontsize: 12.sp)
            ],
          ),
        ),
      ),
    );
  }
}
