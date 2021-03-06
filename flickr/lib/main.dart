import 'package:flickr/Screens/UploadDetails.dart';
import 'package:flutter/material.dart';
import 'Screens/Login_page.dart';
import 'Screens/GetStarted.dart';
import 'Screens/SignUp.dart';
import 'Screens/SubProfile.dart';
import 'Screens/forgetPassPage.dart';
import 'Screens/about.dart';
import 'Screens/UserPage.dart';
import 'package:flutter_plugin_android_lifecycle/flutter_plugin_android_lifecycle.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: 'GetStarted',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        'GetStarted': (context) => GetStarted(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        'LoginScreen': (context) => LoginScreen(),
        'UserPage1': (context) => ImageDetails(),
        'Signup': (context) => Signup(),
        'UserPage': (context) => UserPage(),
        'about': (context) => AboutState(),
        'forgetPass': (context) => forgetPass(),
      },
    ),
  );
}
