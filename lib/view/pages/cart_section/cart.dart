import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:scipro_application/controller/auth_controller/user_uid.dart';
import 'package:scipro_application/controller/cart_controller/cart_controllers.dart';
import 'package:scipro_application/model/afterpayment_model/after_payment_model.dart';
import 'package:scipro_application/view/colors/colors.dart';
import 'package:scipro_application/view/fonts/google_monstre.dart';
import 'package:scipro_application/view/fonts/google_poppins.dart';
import 'package:scipro_application/view/pages/cart_section/widget/cartwidget_container.dart';
import 'package:scipro_application/view/pages/home/homepage.dart';
import 'package:scipro_application/view/widgets/isLoadin_showDilogue/isaLoading_diloguebox.dart';
import 'package:scipro_application/view/widgets/textform%20feild%20Widget/textformfeildWidget.dart';

class CartSectionDesign extends StatefulWidget {
  final String categoryid;
  final String category;
  final String course;
  final num courseprice;
  final String courseID;
  final int duration;

  const CartSectionDesign(
      {super.key,
      required this.category,
      required this.course,
      required this.courseprice,
      required this.courseID,
      required this.duration,
      required this.categoryid});

  @override
  State<CartSectionDesign> createState() => _CartSectionDesignState();
}

class _CartSectionDesignState extends State<CartSectionDesign> {
  bool payment = false;

  final _razorpay = Razorpay();
  final CartController cartController = Get.put(CartController());

  @override
  void initState() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handlePaymentWallet);
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    cartController.userAfterPaymentSuccess();
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Get.offAll(SciproHomePage());
  }

  void _handlePaymentWallet(ExternalWalletResponse response) {
    // print("RezorSucess:" + response.paymentId! + "--" + response.orderId!);
  }
  @override
  Widget build(BuildContext context) {
    cartController.getGSTPercentage().whenComplete(() {
      cartController.calculateSubtotal(widget.courseprice.toInt());
      cartController.totalPrice.value = widget.courseprice.toInt();
      cartController.getAutoFillCoupenCode();
    });
    return Obx(() => Scaffold(
          appBar: AppBar(
              foregroundColor: cWhite,
              backgroundColor: themeColorBlue,
              title: Padding(
                padding: EdgeInsets.only(left: 10.r),
                child: GooglePoppinsWidgets(
                  text: "SHOPPING CART",
                  fontsize: 18.sp,
                  color: cWhite,
                  fontWeight: FontWeight.bold,
                ),
              )),
          body: SingleChildScrollView(
            child: Container(
              height: 800.h,
              width: double.infinity,
              color: const Color.fromARGB(255, 178, 205, 250),
              child: Column(
                children: [
                  CartWidgetContainer(
                      height: 190.h,
                      text: "YOUR CART",
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0.r),
                              child: SizedBox(
                                  width: 80.w,
                                  height: 100.h,
                                  child:
                                      Image.asset("assets/images/SCIPRO.png")),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 15.r),
                                    child: GooglePoppinsWidgets(
                                      text: "RECORDED COURSE",
                                      fontsize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 15.r),
                                    child: GooglePoppinsWidgets(
                                        text: widget.course, fontsize: 16.sp),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 16.r,
                                      top: 8.r,
                                    ),
                                    child: GooglePoppinsWidgets(
                                        text: widget.category, fontsize: 14.sp),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 35.r,
                              ),
                              child: GoogleMonstserratWidgets(
                                text: "Rs. ${widget.courseprice} /-",
                                fontsize: 12.sp,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ]), //////////////////////////////
                  cartController.disableApplyCoupen.value == false
                      ? CartWidgetContainer(
                          height: cartController.coupenboxvalue.value == false
                              ? 98
                              : 250,
                          text: "APPLY COUPONS",
                          children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 10.r, top: 06.r),
                                    child: Row(children: [
                                      GooglePoppinsWidgets(
                                        text: "Do you have any coupon codes ?",
                                        fontsize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      Checkbox(
                                          value: cartController
                                              .coupenboxvalue.value,
                                          activeColor: Colors.green,
                                          onChanged: (newvalue) {
                                            cartController.coupenboxvalue
                                                .value = newvalue!;
                                          })
                                    ]),
                                  ),
                                  cartController.coupenboxvalue.value == true
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 10.r),
                                                  child:
                                                      TextFormFiledContainerWidget(
                                                          enabled: cartController
                                                                      .coupenUSER
                                                                      .value ==
                                                                  true
                                                              ? false
                                                              : true,
                                                          onChanged: (value) {
                                                            cartController
                                                                .starttyping
                                                                .value = true;
                                                            cartController
                                                                    .coupenController
                                                                    .text
                                                                    .isEmpty
                                                                ? cartController
                                                                    .starttyping
                                                                    .value = false
                                                                : true;
                                                          },
                                                          controller: cartController
                                                                      .coupenUSER
                                                                      .value ==
                                                                  true
                                                              ? TextEditingController(
                                                                  text: cartController
                                                                      .userCoupenCode
                                                                      .value)
                                                              : cartController
                                                                  .coupenController,
                                                          hintText:
                                                              "Enter Coupon code",
                                                          title: 'COUPON CODE',
                                                          width: 300),
                                                ),
                                                cartController.coupenUSER
                                                                .value ==
                                                            false &&
                                                        cartController
                                                                .starttyping
                                                                .value ==
                                                            true
                                                    ? Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 10.r),
                                                        child: TextButton.icon(
                                                            onPressed:
                                                                () async {
                                                              cartController
                                                                  .getUserTypingCoupenCode();
                                                            },
                                                            icon: const Icon(
                                                                Icons.search),
                                                            label: const Text(
                                                                "Find")),
                                                      )
                                                    : const SizedBox()
                                              ],
                                            ),
                                            cartController.coupenUSER.value ==
                                                    true
                                                ? Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 15, left: 10),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        cartController
                                                            .applyCoupenCode();
                                                      },
                                                      child: Container(
                                                        height: 40.h,
                                                        width: 120.w,
                                                        decoration: BoxDecoration(
                                                            gradient:
                                                                myGradient,
                                                            color: const Color
                                                                .fromARGB(255,
                                                                46, 48, 214),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        05.r)),
                                                        child: Center(
                                                          child:
                                                              GooglePoppinsWidgets(
                                                            text: "APPLY",
                                                            fontsize: 13.sp,
                                                            color: cWhite,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                : const SizedBox(),
                                          ],
                                        )
                                      : const Column()
                                ],
                              ),
                            ])
                      : const SizedBox(), //////////////////////////////////////
                  CartWidgetContainer(
                      height: 306.h,
                      text: "CHECKOUT",
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0.r),
                                  child: GooglePoppinsWidgets(
                                      text: "SUB TOTAL", fontsize: 14.sp),
                                ),
                                const Spacer(),
                                Padding(
                                  padding: EdgeInsets.only(right: 5.r),
                                  child: GooglePoppinsWidgets(
                                    text: "${cartController.subtotal.value} /-",
                                    fontsize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0.r),
                                  child: GooglePoppinsWidgets(
                                      text: "GST", fontsize: 14.sp),
                                ),
                                const Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(right: 08),
                                  child: GooglePoppinsWidgets(
                                    text: cartController.productGST.value
                                        .toString(),
                                    fontsize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0.r),
                                  child: GooglePoppinsWidgets(
                                      text: "SGST", fontsize: 14.sp),
                                ),
                                const Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(right: 08),
                                  child: GooglePoppinsWidgets(
                                    text: '${cartController.productGST / 2}',
                                    fontsize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0.r),
                                  child: GooglePoppinsWidgets(
                                      text: "CGST", fontsize: 14.sp),
                                ),
                                const Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(right: 08),
                                  child: GooglePoppinsWidgets(
                                    text: '${cartController.productGST / 2}',
                                    fontsize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 40.r),
                              child: Container(
                                height: 70.h,
                                width: 390.w,
                                color: const Color.fromARGB(255, 236, 228, 228),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    GooglePoppinsWidgets(
                                      text:
                                          "${cartController.totalPrice.value} /-",
                                      fontsize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    cartController.razorpayopen.value == true
                                        ? LoadingLottieWidget(
                                            height: 45.h,
                                            width: 200.w,
                                          )
                                        : GestureDetector(
                                            onTap: () async {
                                              await cartController
                                                  .fetchcurrentInvoiceNumber()
                                                  .then((value) {
                                                cartController
                                                    .razorpayopen.value = true;
                                                DateTime exDate = DateTime.now()
                                                    .add(Duration(
                                                        days: widget.duration));
                                                cartController.userselectCourseDetails = UserAfterPaymentModel(
                                                    invoicenumber: cartController
                                                        .currentInvoiceNumber
                                                        .value,
                                                    deactive: false,
                                                    phonenumber:
                                                        Get.find<UserDetailsFecController>()
                                                            .phoneNumber
                                                            .value,
                                                    studentname:
                                                        Get.find<UserDetailsFecController>()
                                                            .studentName
                                                            .value,
                                                    emailid:
                                                        Get.find<UserDetailsFecController>()
                                                            .currentemail
                                                            .value,
                                                    coursecategoryid:
                                                        widget.categoryid,
                                                    uid: Get.find<UserDetailsFecController>()
                                                        .currentUserUid
                                                        .value,
                                                    coursefee: cartController
                                                        .totalPrice.value,
                                                    coursename: widget.course,
                                                    courseid: widget.courseID,
                                                    duration: widget.duration,
                                                    expirydate:
                                                        exDate.toString(),
                                                    joindate: DateTime.now()
                                                        .toString(),
                                                    olduser: true);
                                              });

                                              if (cartController
                                                      .userselectCourseDetails ==
                                                  null) {
                                                return;
                                              } else {
                                                return cartController
                                                    .openRazorPay(_razorpay);
                                              }
                                            },
                                            child: Container(
                                              height: 45.h,
                                              width: 180.w,
                                              decoration: BoxDecoration(
                                                  gradient: myGradient,
                                                  color: const Color.fromARGB(
                                                      255, 46, 48, 214),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          05.r)),
                                              child: Center(
                                                child: GooglePoppinsWidgets(
                                                  text: "PAY AMOUNT",
                                                  fontsize: 15.sp,
                                                  color: cWhite,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ])
                ],
              ),
            ),
          ),
        ));
  }
}
