import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';

class SignupPage extends StatelessWidget {
  SignupPage({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(size: 184.0, middle: 0.5),
            Pin(size: 34.0, start: 75.0),
            child: Text(
              'SHONJIBON',
              style: TextStyle(
                fontFamily: 'Arial Rounded MT Bold',
                fontSize: 30,
                color: const Color(0xffd60000),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 34.0, end: 33.0),
            Pin(size: 48.0, end: 78.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 50.0, middle: 0.5),
            Pin(size: 23.0, end: 91.0),
            child: Text(
              'NEXT',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 20,
                color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 40.0, end: 39.0),
            Pin(size: 574.0, middle: 0.4148),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26.0),
                color: const Color(0xffffffff),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 40.0, start: 63.0),
            Pin(size: 17.0, middle: 0.2981),
            child: Text(
              'Name',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 15,
                color: const Color(0xff605f5f),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 63.0, end: 62.0),
            Pin(size: 31.0, middle: 0.3318),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 37.0, start: 63.0),
            Pin(size: 17.0, middle: 0.3938),
            child: Text(
              'Email',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 15,
                color: const Color(0xff605f5f),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 63.0, end: 62.0),
            Pin(size: 31.0, middle: 0.4291),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 66.0, start: 63.0),
            Pin(size: 17.0, middle: 0.4895),
            child: Text(
              'Password',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 15,
                color: const Color(0xff605f5f),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 63.0, end: 62.0),
            Pin(size: 31.0, middle: 0.5263),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 124.0, start: 63.0),
            Pin(size: 17.0, middle: 0.5853),
            child: Text(
              'Re-type Password',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 15,
                color: const Color(0xff605f5f),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 63.0, end: 62.0),
            Pin(size: 31.0, middle: 0.6235),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 79.0, middle: 0.5014),
            Pin(size: 25.0, middle: 0.1953),
            child: Text(
              'SIGN UP',
              style: TextStyle(
                fontFamily: 'Charter',
                fontSize: 20,
                color: const Color(0xffd60000),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
