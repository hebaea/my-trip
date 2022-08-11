import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:my_trip/app/modules/dashboard/views/dashboard_view.dart';
import 'package:my_trip/main.dart';

class DashboardController extends GetxController {
  var tabIndex = 0;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  void showNotification(String message) {
    flutterLocalNotificationsPlugin.show(
      0,
      "لديك رسالة جديدة",
      message,
      NotificationDetails(
        android: AndroidNotificationDetails(
            channel.id, channel.name, channel.description,
            importance: Importance.high,
            color: Colors.blue,
            playSound: true,
            icon: '@mipmap/ic_launcher'),
      ),
    );
  }

  @override
  void onInit() {
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print("onMessage: ${message.data.toString()}");
      print("onMessage: ${message.data["message"]}");
      showNotification(message.data["message"]);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      print("onMessageOpenedApp: $message");
      if (message.data["navigation"] == "/your_route") {
        int _yourId = int.tryParse(message.data["id"]) ?? 0;
        //   Navigator.push(
        //       navigatorKey.currentState.context,
        //       MaterialPageRoute(
        //           builder: (context) => YourScreen(
        //             yourId:_yourId,
        //           )));
        // });
      }
    });

    @override
    void onReady() {
      super.onReady();
    }

    @override
    void onClose() {}
  }
}
