// import 'package:cloud_functions/cloud_functions.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';
// import 'package:scipro_application/controller/cart_controller/cart_controllers.dart';
// import 'package:scipro_application/view/widgets/custom_showDilog/custom_showdilog.dart';

// Future<void> openRazorPay(BuildContext context) async {
  
//   CartController cartController = Get.find<CartController>();
  
 
    
//   void _handlePaymentSuccess(PaymentSuccessResponse response) async {
//   //  await widget.cartController.userAfterPaymentSuccess();
//   }

//   void _handlePaymentError(PaymentFailureResponse response) {
//     // print("RezorSucess:" + response.paymentId! + "--" + response.orderId!);
//   }

//   void _handlePaymentWallet(ExternalWalletResponse response) {
//     // print("RezorSucess:" + response.paymentId! + "--" + response.orderId!);
//   }

//   return customShowDilogBox(
//       context: context,
//       title: 'Alert',
//       children: [
//         const SizedBox(
//           height: 400,
//           width: 400,
//           child: Center(
//             child: Text('Do'),
//           ),
//         )
//       ],
//       actiononTapfuction: () async{
//              double paymentPrice = cartController.totalPrice.toInt() * 100;
//                    final functions = FirebaseFunctions.instance;
//                     final result = await functions.httpsCallable('createOrder').call(
//           <String, dynamic>{
//             'amount': paymentPrice,
//             'currency': "INR",
//             'receipt': '',
//             'description': '',
//           },
//         );
//             final responseData = result.data as Map<String, dynamic>;
//                     print('ORDER ID: ${responseData["id"]}');

//         var options = {
//           // 'key': 'rzp_live_WkqZiZtSI6LGQ9',
//           'key': 'rzp_test_4H63BqbBLQlmNQ',
//           //amount will be multiple of 100
//           'order_id': responseData["id"],
//           'amount': paymentPrice.toString(), //so its pay 500
//           'name': 'VECTORWIND-TEC',
//           'description': 'SciPro',
//           'timeout': 300, // in seconds
//           'prefill': {'contact': '', 'email': ''}
//         };

//         _razorpay.open(options);
//         //
//         try {} on Razorpay catch (e) {}

//       },
//       doyouwantActionButton: true);
// }
