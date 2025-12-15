import 'package:flutter/material.dart';
import 'package:triply/screens/login.dart';
import 'package:triply/screens/mainscreen.dart';
import 'package:triply/profile/myprofile.dart';
import 'package:triply/profile/myfriends.dart';
import 'package:triply/profile/activities.dart';
import 'package:triply/utils/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Constants.lightTheme,
      home: Login(),
      
      routes: {
        '/login': (context) => Login(),
        '/mainscreen': (context) => MainScreen(),
        '/myprofile': (context) => MyProfile(),
        '/myfriends': (context) => MyFriends(),
        '/activities': (context) => Activity(), // ✅ Changé de Activities() à Activity()
      },
    );
  }
}