import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scipro_application/firebase_options.dart';
import 'package:scipro_application/view/pages/google_signing/google_signing.dart';
import 'package:scipro_application/view/pages/home/cart_section/cart.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await ScreenUtil.ensureScreenSize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(423.5294196844927, 897.2549187389994),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          theme: ThemeData(),
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          home: CartSectionDesign(),
         // home: const GoogleSigninScreen(),
          // home: const SciproHomePage(),
        );
      },
    );
  }
}
