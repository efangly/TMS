import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:temp_noti/firebase_options.dart';
import 'package:temp_noti/src/app.dart';
import 'package:temp_noti/src/services/firebase_api.dart';
import 'package:temp_noti/src/services/network.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Background Message: ${message.notification?.title}");
  print("Background Message: ${message.notification?.body}");
  print("Message: ${message.data.toString()}");
}

void main() async {
  HttpOverrides.global = PostHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotifications();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    if (message.notification != null) {
      print("Message: ${message.notification?.title}");
      print("Message: ${message.notification?.body}");
      print("Message: ${message.data.toString()}");
    }
  });
  runApp(const App());
}
