import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scipro_application/firebase_options.dart';

import 'view/pages/homepage/carosel slider widget/carosel_slider.dart';
import 'view/pages/homepage/homepage.dart';


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
    return const MaterialApp(
      home:SciproHomePage() ,
    );
  }
}
