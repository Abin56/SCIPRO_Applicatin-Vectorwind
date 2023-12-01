import 'package:flutter/material.dart';
import 'package:scipro_application/view/colors/colors.dart';
import 'package:scipro_application/view/fonts/google_poppins.dart';
import 'package:scipro_application/view/pages/checkout_page/payment_action_slider.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: GooglePoppinsWidgets(
              text: "Checkout Page",
              fontsize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
            child: Container(
              height: 250,
              width: 350,
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
                gradient: LinearGradient(
                    colors: [Colors.blue, Colors.red],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
                boxShadow: [
                  BoxShadow(color: Colors.red, offset: Offset(15, 15))
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "Purchasing Course Details",
                        style: TextStyle(fontSize: 20),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: GooglePoppinsWidgets(
                      text: " Course : Test",
                      fontsize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: GooglePoppinsWidgets(
              text: "Order Summary",
              fontsize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(
            thickness: 2,
            color: cred,
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Container(
              height: 60,
              width: double.infinity,
              color: cWhite,
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GooglePoppinsWidgets(
                      text: "Sub Total :",
                      fontsize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 60),
                      child: Text(
                        "1/-",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 70,
            width: 350,
            decoration: const BoxDecoration(
              color: Colors.blueAccent,
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 225, 100, 142),
                Color.fromARGB(255, 101, 144, 216)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GooglePoppinsWidgets(
                    text: "Total : ",
                    fontsize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Text(
                      "1/-",
                      style: TextStyle(
                          color: cWhite,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Container(
                height: 70,
                width: 350,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: const PaymentActionSlider()),
          ),
        ],
      )),
    );
  }
}
