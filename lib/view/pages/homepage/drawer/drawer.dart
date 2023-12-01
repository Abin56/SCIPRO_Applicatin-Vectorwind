// ignore_for_file: non_constant_identifier_names, duplicate_ignore, empty_catches, unused_element

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scipro_application/view/colors/colors.dart';
import 'package:scipro_application/view/pages/homepage/drawer/menu.dart';
import 'package:scipro_application/view/pages/homepage/drawer/rec_couses_list.dart';


class MyHeaderDrawer extends StatelessWidget {
  const MyHeaderDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: themeColorBlue,
      width: double.infinity,
      height: 250,
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 0),
            height: 150,
            width: 150,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage("assets/images/SCIPRO.png"),
              ),
            ),
          ),
          const Text(
            "SCI PRO",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "info@scipro.in",
            style: TextStyle(color: Colors.amber[200], fontSize: 12),
          )
        ],
      ),
    );
  }
}

Widget MenuItem(int id, String title, IconData? icon, bool selected, onTap) {
  return Material(
    color: cWhite,
    child: InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Expanded(
              child: Icon(
                icon,
                size: 20,
                color: themeColorBlue,
              ),
            ),
            Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: const TextStyle(color: themeColorBlue, fontSize: 16),
                ))
          ],
        ),
      ),
    ),
  );
}

enum DrawerSections {
  dashboard,
  favourites,
  setting,
  share,
  feedback,
  contact,
  about,
}

// ignore: non_constant_identifier_names
Widget MyDrawerList(context) {
  void signOut(context) async {
    final auth = FirebaseAuth.instance;
    try {
      await auth.signOut().then((value) => {
            // Navigator.pushAndRemoveUntil(
            //     context,
            //     MaterialPageRoute(builder: (context) => const Gsignin()),
            //     (route) => false)
          });
    } catch (e) {}
  }

  void errorBox(context, e) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Error"),
            content: Text(e.toString()),
          );
        });
  }

  var currentPage = DrawerSections.dashboard;
  return Container(
    padding: const EdgeInsets.only(top: 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // show list  of menu drawer.........................
      children: [
        MenuItem(1, "Recorded Courses", Icons.fiber_smart_record_sharp,
            currentPage == DrawerSections.dashboard ? true : false, () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) => RecordedCoursesListScreen())
             );
       }
       ),
      
        MenuItem(3, "Setting", Icons.settings,
            currentPage == DrawerSections.setting ? true : false, () {
          termsAndConditions(context);
        }),
        // MenuItem(4, "Share", Icons.share,
        //     currentPage == DrawerSections.share ? true : false, () async {
        //   // await  Share.share('https://play.google.com/store/apps/details?id=in.brototype.BrotoPlayer');
        // }),
        MenuItem(4, "Contact us", Icons.contact_mail_outlined,
            currentPage == DrawerSections.contact ? true : false, () {
          contactus(context);
        }),
        MenuItem(5, "About", Icons.account_box_outlined,
            currentPage == DrawerSections.about ? true : false, () {
          showAboutDialog(
              context: context,
              applicationIcon: const Image(
                image: AssetImage('assets/images/SCIPRO.png'),
                height: 100,
                width: 100,
              ),
              applicationName: "SCI PRO",
              applicationVersion: '1.0.2',
              children: [
                const Text(
                    'SCI PRO is a Education App created by VECTORWIND-TECHSYSTEMS PRIVATE LIMITED.')
              ]);
        }),
        MenuItem(6, "Logout", Icons.logout,
            currentPage == DrawerSections.dashboard ? true : false, () {
          signOut(context);
        }),
  Container(
    height: 20,
    color: cWhite,
  ),
  Padding(
           padding: const EdgeInsets.only(top: 10,left: 10),
           child: SizedBox(
            height: 80.h,
        
            child: Stack(children: [
              Positioned(
                
                top: 10.w,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Owned by",
                      style: TextStyle(
                          color: themeColorBlue, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Positioned(
                  top: 40.h,
                  left:2.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // CircleAvatar(
                      //   child: Container(width: 20.w,
                      //     decoration: const BoxDecoration(color: cWhite,
                      //     image: DecorationImage(fit: BoxFit.fitHeight,
                      //       image:AssetImage(
                              
                      //           'assets/images/vector.png'),)
                      //   ),
                        
                      //   ),
                      // ),
                      ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.h),
                                    topRight:
                                        Radius.circular(10.h)), // Image border
                                child: SizedBox.fromSize(
                                  size: Size.fromRadius(18.r), // Image radius
                                  child: Image.asset('assets/images/vector.png',
                                      fit: BoxFit.fill),
                                ),
                              ),

                     
                      Padding(
                        padding:  EdgeInsets.only(top: 5.w,left: 8.w),
                        child: Text(
                          "VECTOEWIND-TECH SYSTEM PVT LIMITED",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey,
                              fontSize: 13.sp),
                        ),
                      ),
                    ],
                  ))
            ]),
                   ),
         ),

         Padding(
           padding: const EdgeInsets.only(top: 10,left: 10),
           child: SizedBox(
            height: 80.h,
        
            child: Stack(children: [
              Positioned(
                
                top: 10.w,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Developed by",
                      style: TextStyle(
                          color: themeColorBlue, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Positioned(
                  top: 40.h,
                  left:2.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        backgroundColor: cWhite,
                        backgroundImage: NetworkImage(
                            'https://firebasestorage.googleapis.com/v0/b/leptonscipro-31792.appspot.com/o/files%2Fimages%2FL.png?alt=media&token=135e14d0-fb5a-4a21-83a6-411f647ec974'),
                      ),
                     
                      Padding(
                        padding:  EdgeInsets.only(top: 5.w),
                        child: Text(
                          "  Lepton Plus Communications",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey,
                              fontSize: 14.sp),
                        ),
                      ),
                    ],
                  ))
            ]),
                   ),
         ),
         Padding(
           padding: const EdgeInsets.only(bottom: 300,left: 100),
           child: SizedBox(
            height: 80.h,
                 
            child: Stack(children: [
               Positioned(
                left: 5.w,
                top: 25.h,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.adb_outlined,
                      color: Colors.green,
                    ),
                    Text(
                      " Version",
                      style: TextStyle(
                          color: cGrey, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Positioned(
                  top: 58.h,
                  left: 44.w,
                  child:  Column(
                    children: [
                      Text(
                        "1.0.5",
                        style: TextStyle(
                            color: cGrey,
                            // color: cWhite,
                            fontSize: 10.sp),
                      ),
                    ],
                  ))
            ]),
                   ),
         ),
      ],
    ),
  );
}

Widget emptyDisplay(String section) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "No $section Found",
          style:  TextStyle(
            color: Colors.white,
            fontSize: 25.sp,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
