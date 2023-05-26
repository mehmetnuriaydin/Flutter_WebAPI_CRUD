import 'dart:io';

import 'package:api_project/activity_operations/activity_creation_screen.dart';
import 'package:api_project/homepage.dart';
import 'package:api_project/user_operations/user_creation_screen.dart';
import 'package:api_project/user_operations/user_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:api_project/navigation_utils.dart';
import 'activity_operations/activity_list_screen.dart';
import 'activity_operations/delete_activity_screen.dart';
import 'user_operations/delete_user_screen.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API TEST APP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
