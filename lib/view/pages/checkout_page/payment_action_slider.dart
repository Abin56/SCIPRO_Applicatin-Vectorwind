import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';

class PaymentActionSlider extends StatelessWidget {
  const PaymentActionSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            // const SizedBox(height: 24.0),
            ActionSlider.standard(
              backgroundColor: const Color.fromARGB(218, 119, 217, 202),
              // customForegroundBuilderChild: const DecoratedBox(
              //     decoration: BoxDecoration(
              //         gradient: LinearGradient(
              //             colors: [Colors.black12, Colors.cyanAccent]))),
              width: 350.0,
              action: (controller) async {
                controller.loading(); //starts loading animation
                await Future.delayed(const Duration(seconds: 3));
                controller.success(); //starts success animation
                await Future.delayed(const Duration(seconds: 1));
                controller.reset(); //resets the slider
              },
              direction: TextDirection.ltr,
              height: 70,

              toggleColor: const Color.fromARGB(255, 13, 138, 134),
              child: const Padding(
                padding: EdgeInsets.only(left: 50),
                child: Text(
                  'Proceed To Pay Online',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
