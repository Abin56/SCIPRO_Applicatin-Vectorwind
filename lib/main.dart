import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scipro_application/firebase_options.dart';
import 'package:scipro_application/view/colors/colors.dart';
import 'package:scipro_application/view/pages/recorded_courses/select_ur_plan/select_ur_plan.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(backgroundColor: themeColorBlue),
        body: const SelectYourPlanPart()),
    );
  }
}
