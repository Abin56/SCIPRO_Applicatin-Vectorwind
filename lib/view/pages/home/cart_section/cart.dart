import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scipro_application/view/colors/colors.dart';
import 'package:scipro_application/view/fonts/google_monstre.dart';
import 'package:scipro_application/view/fonts/google_poppins.dart';

const LinearGradient myGradient = LinearGradient(
    begin: Alignment.centerLeft,
    colors: [
      Color.fromARGB(255, 46, 48, 214),
      Color.fromARGB(255, 106, 17, 214),
    ],
  );

class CartSectionDesign extends StatelessWidget {
  const CartSectionDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: themeColorBlue,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              size: 32.sp,
              color: cWhite,
            ),
          ),
          title: Padding(
            padding: EdgeInsets.only(left: 10.r),
            child: GooglePoppinsWidgets(
              text: "Cart",
              fontsize: 18.sp,
              //fontWeight: FontWeight.w400,
              color: cWhite,
            ),
          )),
      body: SingleChildScrollView(
        child: Container(
          height: 800.h,
          width: double.infinity,
          color: const Color.fromARGB(255, 178, 205, 250),
          
          child: Column(
            children: [
              CartWidgetContainer(
                height: 190.h,
                text: "YOUR CART",
                children: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0.r),
                      child: SizedBox(
                          width: 80.w,
                          height: 100.h,
                          child: Image.asset("assets/images/SCIPRO.png")),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(left: 15.r),
                          child: GooglePoppinsWidgets(
                            text: "Choose",
                            fontsize: 17.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(left: 15.r),
                          child: GooglePoppinsWidgets(
                              text: "Category Name", fontsize: 16.sp),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(
                            left: 16.r,
                            top: 8.r,
                          ),
                          child:
                              GooglePoppinsWidgets(text: "Physics", fontsize: 14.sp),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 35.r,right: 1.r),
                      child: GoogleMonstserratWidgets(
                        text: "Rs. 230",
                        fontsize: 17.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),//////////////////////////////
              CartWidgetContainer(height: 140.h,
              text: "APPLY COUPENS",
              children:Padding(
                padding: EdgeInsets.only(left: 12.r,top: 0.r),
                child: Row(
                  children: [
                  GooglePoppinsWidgets(text: "Apply Your Coupen Here", fontsize: 15.sp,fontWeight: FontWeight.w400,),
                 Padding(
                   padding:  EdgeInsets.all(8.0.r),
                   child: Container(
                    height: 50.h,
                    width: 130.w,
                    decoration: BoxDecoration(
                        gradient:myGradient,
                        color: const Color.fromARGB(255, 46, 48, 214),
                      borderRadius: BorderRadius.circular(10.r)),
                    child: Padding(
                      padding: EdgeInsets.only(left: 30.r, top: 10.r),
                      child: GooglePoppinsWidgets(
                        text: "Apply",
                        fontsize: 18.sp,
                       // fontWeight: FontWeight.w500,
                        color: cWhite,
                      ),
                    ),
                                   ),
                 ),
                ]),
              ) ,),//////////////////////////////////////
              CartWidgetContainer(height: 306.h, 
              text: "CHECKOUT",
               children: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Padding(
                      padding:  EdgeInsets.all(8.0.r),
                      child: GooglePoppinsWidgets(text: "Your cart subtotal", fontsize: 16.sp),
                    ),
                    SizedBox(width: 160.w,),
                      Padding(
                        padding:  EdgeInsets.only(right: 5.r),
                        child: GooglePoppinsWidgets(text: "250", fontsize: 16.sp),
                      )
                  ],),
                   Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                    Padding(
                      padding: EdgeInsets.all(8.0.r),
                      child: GooglePoppinsWidgets(text: "Discount through applied coupen", fontsize: 16.sp),
                    ),
                     SizedBox(width: 40.w,),
                      GooglePoppinsWidgets(text: "25", fontsize: 16.sp)
                  ],),
                   Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    Padding(
                      padding: EdgeInsets.all(8.0.r),
                      child: GooglePoppinsWidgets(text: "GST", fontsize: 16.sp),
                    ),
                     SizedBox(width: 268.w,),
                      Padding(
                        padding: EdgeInsets.only(left: 20.r),
                        child: GooglePoppinsWidgets(text: "25", fontsize: 16.sp),
                      )
                  ],),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                    Padding(
                      padding: EdgeInsets.all(8.0.r),
                      child: GooglePoppinsWidgets(text: "SST", fontsize: 16.sp),
                    ),
                     SizedBox(width: 268.w,),
                      Padding(
                        padding: EdgeInsets.only(left: 20.r),
                        child: GooglePoppinsWidgets(text: "25", fontsize: 16.sp),
                      )
                  ],),
                   Padding(
                     padding:  EdgeInsets.only(top: 7.r),
                     child: Container(
                      height: 70.h,
                      width: 390.w,
                      color: const Color.fromARGB(255, 236, 228, 228),
                       child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                        GooglePoppinsWidgets(text: "225", fontsize: 18.sp,fontWeight: FontWeight.w500,),
                         Container(
                      height: 50.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                          gradient: myGradient,
                          color: const Color.fromARGB(255, 46, 48, 214),
                        borderRadius: BorderRadius.circular(10.r)),
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.r, top: 12.r),
                        child: GooglePoppinsWidgets(
                          text: "Checkout",
                          fontsize: 18.sp,
                         // fontWeight: FontWeight.w500,
                          color: cWhite,
                        ),
                      ),
                                     ),
                                         ],),
                     ),
                   )
                ],
              ))
            ],
          ),
          
        ),
      ),
    );
  }
}

class CartWidgetContainer extends StatelessWidget {
  final double height;
  final String text;
  final Widget children;
  const CartWidgetContainer({
    required this.height,
    required this.text,
    required this.children,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: height,
            width: 390.w,
            decoration: BoxDecoration(
                color: cWhite, borderRadius: BorderRadius.circular(10.r)),
            child: Column(
              children: [
                Container(
                  height: 70.h,
                  width: 390.w,
                  decoration: BoxDecoration(
                      gradient: myGradient,
                      color: const Color.fromARGB(255, 46, 48, 214),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.r),
                          topRight: Radius.circular(10.r))),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.r, top: 16.r),
                    child: GooglePoppinsWidgets(
                      text: text,
                      fontsize: 19.sp,
                      //fontWeight: FontWeight.w500,
                      color: cWhite,
                    ),
                  ),
                ),
                Row(
                  children: [children],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
