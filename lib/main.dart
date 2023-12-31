import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:get/get.dart';
import 'package:scipro_application/firebase_options.dart';
import 'package:scipro_application/view/pages/splash%20screen/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await ScreenUtil.ensureScreenSize();

  await disableCapture();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp

  ]).then((value) {
  runApp(const MyApp());

  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.portraitUp,
// //ensures portrait at all times. you can override this if necessary
//     ]);
    return ScreenUtilInit(
      designSize: const Size(423.5294196844927, 897.2549187389994),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(

          debugShowCheckedModeBanner: false,
          title: 'First Method',
          home: SplashScreen(),
        );
      },
    );
  }
}

Future disableCapture() async {
  await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_KEEP_SCREEN_ON);
}
