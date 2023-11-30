import 'package:flutter/material.dart';
import 'package:scipro_application/view/colors/colors.dart';
import 'package:scipro_application/view/fonts/google_poppins.dart';

class SelectYourPlanPart extends StatelessWidget {
  const SelectYourPlanPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color.fromARGB(255, 235, 176, 180),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(children: [
              const Icon(Icons.arrow_back,size: 32,),
              GooglePoppinsWidgets(text: "Select Your Plan", fontsize: 16,fontWeight: FontWeight.w400,)
            ],),
            SeletPlanContanierWidget()
          ],
        ),
      ),
    );
  }
}

class SeletPlanContanierWidget extends StatelessWidget {
  
  const SeletPlanContanierWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        height: 130,
        width: 300,
        decoration: BoxDecoration( color: cWhite,borderRadius: BorderRadius.circular(18)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 35,
                    width: 170,
                    decoration: BoxDecoration(color:cGreen,borderRadius: BorderRadius.circular(8), ),
                     child: Center(child: GooglePoppinsWidgets(text: "Course Name", fontsize: 14,color: cWhite,)),
                  ),const Spacer(),
                   const Icon(Icons.more_vert),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  children: [
                    GooglePoppinsWidgets(text: "Duration :", fontsize: 14),
                     GooglePoppinsWidgets(text: " 4"+" Days", fontsize: 14),
                  ],
                ),
              ),
               Row(
                  children: [
                    GooglePoppinsWidgets(text: "4000 /- :", fontsize: 14),
                     GooglePoppinsWidgets(text: "(including all taxes)", fontsize: 14),
                  ],
                ),
            ],
          ),
        ),
       
      ),
    );
  }
}