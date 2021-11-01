import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shonjibon/homePage.dart';
import 'package:splashscreen/splashscreen.dart';

import 'LoginPage.dart';

class Splash extends StatefulWidget {
  const Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        image: Image(
          image: AssetImage("asset/logo.png"),
        ),
        // navigateAfterSeconds: LoginPage(),
        navigateAfterFuture: redirectUI(),
        seconds: 3,
        loadingText: Text(
          "Loading",
          style: TextStyle(
            fontSize: 20,
          ),
        ));
  }
}

Future<Widget> redirectUI() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString("token");
  if (token != null) {
    return Future.value(new homePage(token: token));
  }
  return Future.value(new LoginPage());
}
