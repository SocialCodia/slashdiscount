// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:slashdiscount/controllers/auth_controller.dart';
// import 'package:slashdiscount/handlers/sp_handler.dart';
// import 'package:slashdiscount/styles/colors.dart';
// import 'package:slashdiscount/utils/constants.dart';
//
// final FirebaseMessaging fcm = FirebaseMessaging.instance;
// FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();
//
// const AndroidNotificationChannel channel = AndroidNotificationChannel(
//     Constants.appUserName, Constants.appName,
//     playSound: true, importance: Importance.high);
//
// Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {}
//
// class NotificationService {
//   Future<void> init() async {
//     await Firebase.initializeApp();
//
//     await fcm.requestPermission(
//       sound: true,
//       alert: true,
//       announcement: true,
//       badge: true,
//     );
//
//     String? fcmToken = await fcm.getToken();
//
//     if (fcmToken != null) {
//       if (SpHandler.isLoggedIn()) {
//         // AuthController.updateFirebaseToken(fcmToken);
//       }
//     }
//
//     FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
//
//     flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(channel);
//
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       showMessage(message);
//     });
//   }
//
//   void showMessage(RemoteMessage message) {
//     RemoteNotification? notification = message.notification;
//     AndroidNotification? android = notification!.android;
//     if (android != null) {
//       flutterLocalNotificationsPlugin.show(
//           notification.hashCode,
//           notification.title,
//           notification.body,
//           NotificationDetails(
//               android: AndroidNotificationDetails(channel.id, channel.name,
//                   color: MyColor.primaryColor,
//                   playSound: true,
//                   icon: '@mipmap/ic_launcher')));
//     }
//   }
// }
