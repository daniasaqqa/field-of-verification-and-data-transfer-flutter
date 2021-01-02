import 'package:ass_toww/secreens/splash.dart';
import 'package:flutter/material.dart';

import 'models/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static List<User> userList = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'dania',
      theme: ThemeData(
          primaryColor: Colors.cyan, scaffoldBackgroundColor: Colors.white),
      home: Splash(),
    );
  }
}
