import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// @pragma('vm:entry-point')
// Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

//   const channel = AndroidNotificationChannel(
//     'high_importance_channel',
//     'High Importance Notifications',
//     description: 'This channel is used for important notifications.',
//     importance: Importance.high,
//   );

//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   await flutterLocalNotificationsPlugin
//       .resolvePlatformSpecificImplementation<
//           AndroidFlutterLocalNotificationsPlugin>()
//       ?.createNotificationChannel(channel);

//   // Show the notification
//   RemoteNotification? notification = message.notification;
//   AndroidNotification? android = message.notification?.android;
//   if (notification != null && android != null && !kIsWeb) {
//     flutterLocalNotificationsPlugin.show(
//       notification.hashCode,
//       notification.title,
//       notification.body,
//       NotificationDetails(
//         android: AndroidNotificationDetails(
//           channel.id,
//           channel.name,
//           channelDescription: channel.description,
//           icon: "ic_launcher_foreground",
//           largeIcon: const DrawableResourceAndroidBitmap(
//             "ic_launcher_foreground",
//           ),
//         ),
//       ),
//     );
//   }

//   print('Handling a background message ${message.messageId}');
// }

class NotificationWrapper extends StatefulWidget {
  final BuildContext context;
  final Widget child;

  const NotificationWrapper(
      {super.key, required this.child, required this.context});

  @override
  State<NotificationWrapper> createState() => _NotificationWrapperState();
}

class _NotificationWrapperState extends State<NotificationWrapper> {
  late AndroidNotificationChannel channel;
  bool isFlutterLocalNotificationsInitialized = false;

  Future<void> setupFlutterNotifications() async {
    if (isFlutterLocalNotificationsInitialized) {
      return;
    }
    channel = const AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notifications.',
      importance: Importance.high,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    isFlutterLocalNotificationsInitialized = true;
  }

  void showFlutterNotification(RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (notification != null && android != null && !kIsWeb) {
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            icon: "ic_launcher_foreground",
            largeIcon: const DrawableResourceAndroidBitmap(
              "ic_launcher_foreground",
            ),
          ),
        ),
      );
    }

    // final badgeCount = message.data['badge'];

    // NotificationUtils.updateBadgeCount(int.tryParse(badgeCount) ?? 0);
  }

  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void initState() {
    // NotificationUtils.initializedNotificationCount();
    firebaseStatUp();

    setupFlutterNotifications();

    super.initState();
  }

  firebaseStatUp() async {
    final apnsToken = await FirebaseMessaging.instance.getAPNSToken();
    if (apnsToken != null) {}

    final fcmToken = await FirebaseMessaging.instance.getToken();
    debugPrint("fcm: $fcmToken");

    // FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessage.listen(showFlutterNotification);

    if (!kIsWeb) {
      await setupFlutterNotifications();
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
