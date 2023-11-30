import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:scipro_application/view/colors/colors.dart';
import 'package:scipro_application/view/fonts/google_poppins.dart';

class GoogleSignindScreen extends StatelessWidget {
  const GoogleSignindScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhite,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(
          top: 180.r,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 250.w,
              height: 50.h,
              color: themeColorBlue.withOpacity(0.8),
              child: Center(
                child: GooglePoppinsWidgets(
                  text: "WELCOME  TO",
                  fontsize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: cWhite,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.r),
              child: SizedBox(
                height: 300.h,
                width: double.infinity,
                child: Image.asset('assets/images/SCIPRO.png'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.r),
              child: Center(
                child: SizedBox(
                  height: 52.h,
                  width: 280.w,
                  child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(cWhite)),
                      onPressed: () {},
                      child: Padding(
                        padding: EdgeInsets.all(10.r),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 35.h,
                              width: 35.w,
                              child: Image.asset('assets/png/google_png.png'),
                            ),
                            const Text("   Sign in with Google"),
                          ],
                        ),
                      )),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
