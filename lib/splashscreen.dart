import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shonjibon/iPhone12ProMax1.dart';
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
          image: AssetImage("assets/logo.png"),
        ),
        navigateAfterSeconds: LoginPage(),
        seconds: 3,
        loadingText: Text(
          "Loading",
          style: TextStyle(
            fontSize: 20,
          ),
        ));
  }
}
