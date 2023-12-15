import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:scipro_application/controller/auth_controller/user_uid.dart';
import 'package:scipro_application/model/afterpayment_model/after_payment_model.dart';
import 'package:scipro_application/model/afterpayment_model/user_details_model.dart';
import 'package:scipro_application/view/colors/colors.dart';
import 'package:scipro_application/view/constant/const.dart';
import 'package:scipro_application/view/core/core.dart';
import 'package:scipro_application/view/pages/home/homepage.dart';
import 'package:uuid/uuid.dart';

class CartController extends GetxController {
  RxBool starttyping = false.obs;

  RxBool coupenboxvalue = false.obs;
  RxInt gstpercentagevalue = 0.obs;
  RxDouble subtotal = 0.0.obs;
  RxDouble productGST = 0.0.obs;
  RxInt totalPrice = 0.obs;
  RxBool coupenUSER = false.obs;
  RxString userCoupenCode = ''.obs;
  RxInt coupenDiscount = 0.obs;
  RxBool disableApplyCoupen = false.obs;
  FocusNode focusNode = FocusNode();
  UserAfterPaymentModel? userselectCourseDetails;
  RxBool razorpayopen = false.obs;

  TextEditingController coupenController = TextEditingController();

  Future<void> getGSTPercentage() async {
    final data =
        await dataserver.collection('Gst_settings').doc('percentage').get();

    final int result = data.data()?['percentage'];
    gstpercentagevalue.value = result;
  }

  calculateSubtotal(int price) {
    var gst = price * gstpercentagevalue.value / 100;
    productGST.value = gst;

    double result = price - gst;
    subtotal.value = result;
  }

  Future<void> getAutoFillCoupenCode() async {
    final data = await dataserver
        .collection('CoupenManagement')
        .doc('abinjohn8089@gmail.com')
        .get();
    if (data.data() == null) {
      coupenUSER.value = false;
    } else {
      coupenUSER.value = true;
      coupenboxvalue.value = true;
      userCoupenCode.value = data.data()?['coupenCode'];
      coupenDiscount.value = data.data()?['discount'];
      return showToast(msg: 'Coupon auto applied');
    }
  }

  Future<void> getUserTypingCoupenCode() async {
    String iddd = '28678100-a61a-1def-ad15-edc92e0e56c2';
    final data =
        await dataserver.collection('CoupenManagement').doc(iddd).get();
    // print("KKKKKKK ${coupenController.text.trim()}");
    if (data.data() == null) {
      return showToast(msg: 'Ohh ! Sorry this coupon is found');
    } else {
      coupenUSER.value = true;
      userCoupenCode.value = data.data()?['coupenCode'];
      coupenDiscount.value = data.data()?['discount'];
      return showToast(msg: 'Ohh ! Great ');

      // print(">>>>>>>>>>>>>>>>  ${userCoupenCode.value}");
    }
  }

  Future<void> applyCoupenCode() async {
    disableApplyCoupen.value = true;
    var result = totalPrice.value * coupenDiscount.value / 100;
    var totalprice = totalPrice.value - result.toInt();
    print('/////////////// $result');
    totalPrice.value = totalprice.toInt();
    var calculatesubtotal = subtotal.value * coupenDiscount.value / 100;
    var subtotalresult = subtotal.value - calculatesubtotal.toInt();

    subtotal.value = subtotalresult.toDouble();
  }

  Future<void> openRazorPay(Razorpay razorpay) async {
    //
    try {
      double paymentPrice = 1 * 100;
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
      if (kDebugMode) {
        print('ORDER ID: ${responseData["id"]}');
      }

      var options = {
        // 'key': 'rzp_live_WkqZiZtSI6LGQ9',
        'key': 'rzp_test_4H63BqbBLQlmNQ',
        //amount will be multiple of 100
        // 'order_id': responseData["id"],
        'amount': paymentPrice.toString(), //so its pay 500
        'name': 'VECTORWIND-TEC',
        'description': 'SciPro',
        'timeout': 300, // in seconds
        'prefill': {'contact': '', 'email': ''}
      };

      razorpay.open(options);
    } on Razorpay catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future<void> userAfterPaymentSuccess() async {
    final uuid = const Uuid().v1();
    String uid = Get.find<UserDetailsFecController>().currentUserUid.value;
    final userdetails = UserDetailsModel(
        uid: uid,
        email: Get.find<UserDetailsFecController>().currentemail.value,
        studentname: Get.find<UserDetailsFecController>().studentName.value,
        phonenumber: Get.find<UserDetailsFecController>().phoneNumber.value,
        joindate: DateTime.now().toString());

    await dataserver
        .collection('SubscribedStudents')
        .doc(uid)
        .set(userdetails.toMap())
        .then((value) async {
      await dataserver
          .collection('SubscribedStudents')
          .doc(uid)
          .collection("PurchasedCourses")
          .doc(uuid)
          .set(userselectCourseDetails!.toMap())
          .then((value) async {
        await dataserver
            .collection('SubscribedStudents')
            .doc(uid)
            .collection("PurchasedCourses")
            .doc(uuid)
            .set({'docid': uuid}, SetOptions(merge: true)).then((value) {
          Get.off(SciproHomePage());
          return Get.snackbar("Message", "Payement Successfull",
              backgroundColor: cWhite);
        });
      });
    });
  }
}
