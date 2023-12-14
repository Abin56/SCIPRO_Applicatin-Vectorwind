import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:scipro_application/controller/push_notification/notification_service.dart';
import 'package:scipro_application/view/constant/constant.validate.dart';

class PushNotificationController extends GetxController {
  @override
  void onReady() {
    userRequestPermission(); //user notification permission
    getDeviceToken(); // Get User Current Device token
    notificationServices.firebaseInit();
    notificationServices.setupInteractMessage();
    super.onReady();
  }

  NotificationServices notificationServices = NotificationServices();
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  String deviceToken = '';
  void userRequestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      log('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      log('User granted provisional permission');
    } else {
      log('User declined or has not accepted permission');
    }
  }

  void getDeviceToken() async {
    await FirebaseMessaging.instance.getToken().then((token) {
      deviceToken = token ?? 'Not get the token ';
      log("User Device Token :: $token");

      saveDeviceTokenToFireBase(deviceToken);
    });
  }

  void saveDeviceTokenToFireBase(String deviceToken) async {
    await FirebaseFirestore.instance
        .collection("UserDeviceToken")
        .doc(currentuserUID)
        .set({'deviceToken': deviceToken}).then(
            (value) => log('Device Token Saved To FIREBASE'));
  }

  Future<void> sendPushMessage(String token, String body, String title) async {
    log("Send Push Message");
    try {
      final reponse = await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization':
              'key=AAAArVH5gWk:APA91bGhwnnUDTQJpGd2G5saUhzKwvIG_lpottSeVS_EMwE_UY2RX79jrtYBILeUl2V_URZUUTGSrPStS4cku6iJ1drG85XeZ0b8mMbaqEGudkEnEhtcLowiF5nDT85-_czIRYYIMJW9'
        },
        body: jsonEncode(
          <String, dynamic>{
            'priority': 'high',
            'data': <String, dynamic>{
              'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'status': 'done',
              'body': body,
              'title': title,
            },
            "notification": <String, dynamic>{
              'title': title,
              'body': body,
              'android_channel_id': 'high_importance_channel'
            },
            'to': device_id[0],
          },
        ),
      );
      log("response --L>>  ${reponse.body}");
    } catch (e) {
      if (kDebugMode) {
        log("error push Notification");
      }
    }
  }
}

List<String> device_id = [
  'cKTLPX6fSZiuCbKXmSNRFt:APA91bGIwK4nsPU2-NnsLvEBFs_UIf5jAXOGteuonwd4n8s1ijQwI8_nH1OOudhZlSiB7Z2Mo1Ud9qCEmPPAUPOqtqiuWatfr7FgpQMLbXW1FAES_m7XUa26xluMh-15gZIvKp99hqP4',
];
