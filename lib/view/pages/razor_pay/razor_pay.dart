// ignore_for_file: sort_child_properties_last, must_be_immutable, unused_catch_clause, empty_catches
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  bool payment = false;

  final _razorpay = Razorpay();
  @override
  void initState() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handlePaymentWallet);

    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {}

  void _handlePaymentError(PaymentFailureResponse response) {
    // print("RezorSucess:" + response.paymentId! + "--" + response.orderId!);
  }

  void _handlePaymentWallet(ExternalWalletResponse response) {
    // print("RezorSucess:" + response.paymentId! + "--" + response.orderId!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 36, 44, 59),
      body: FloatingActionButton(onPressed: () async {
        double ttotalPrice = 1;
        double paymentPrice = ttotalPrice * 100;
        //
        final functions = FirebaseFunctions.instance;

        final result = await functions.httpsCallable('createOrder').call(
          <String, dynamic>{
            'amount': paymentPrice,
            'currency': "INR",
            'receipt': '',
            'description': '',
          },
        );
        final responseData = result.data as Map<String, dynamic>;
        // final orderDetails = ProcessingOrder.fromMap(responseData);
        print('ORDER ID: ${responseData["id"]}');

        var options = {
          'key': 'rzp_live_WkqZiZtSI6LGQ9',
          // 'key': 'rzp_test_4H63BqbBLQlmNQ',
          //amount will be multiple of 100
          'order_id': responseData["id"],
          'amount': paymentPrice.toString(), //so its pay 500
          'name': 'VECTORWIND-TEC',
          'description': 'SciPro',
          'timeout': 300, // in seconds
          'prefill': {
            'contact':
                '',
            'email': ''
          }
        };

        _razorpay.open(options);
        //
        try {} on Razorpay catch (e) {}
      }),
    );
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }
}
