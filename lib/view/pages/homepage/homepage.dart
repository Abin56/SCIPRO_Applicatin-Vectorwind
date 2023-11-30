import 'package:flutter/material.dart';

class SciproHomePage extends StatelessWidget {
  const SciproHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return   SafeArea(
      child: Container(width: double.infinity,height: 100,
      color: Colors.white,
        child:const Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.start,
            children: [
            Icon(Icons.menu)
          ],),
           Row(mainAxisAlignment: MainAxisAlignment.start,
            children: [
            Icon(Icons.menu)
          ],),
        ],) ,
      ),
    ) ;
  }
}