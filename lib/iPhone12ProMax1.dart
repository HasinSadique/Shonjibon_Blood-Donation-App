import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';

class iPhone12ProMax1 extends StatelessWidget {
  // iPhone12ProMax1({
  //   Key key,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          // Pinned.fromPins(
          //   Pin(start: -88.0, end: 60.0),
          //   Pin(size: 325.0, start: -143.0),
          //   child: Container(
          //     decoration: BoxDecoration(
          //       borderRadius:
          //           BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
          //       color: const Color(0xffff0000),
          //       border: Border.all(width: 1.0, color: const Color(0xffff0000)),
          //     ),
          //   ),
          // ),
          // Pinned.fromPins(
          //   Pin(size: 410.0, end: -86.0),
          //   Pin(size: 244.0, start: 34.0),
          //   child: Container(
          //     decoration: BoxDecoration(
          //       borderRadius:
          //           BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
          //       color: const Color(0xffff0000),
          //       border: Border.all(width: 1.0, color: const Color(0xffff0000)),
          //     ),
          //   ),
          // ),
          // Pinned.fromPins(
          //   Pin(size: 263.0, end: -110.0),
          //   Pin(size: 317.0, start: -170.0),
          //   child: Container(
          //     decoration: BoxDecoration(
          //       borderRadius:
          //           BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
          //       color: const Color(0xffff0000),
          //       border: Border.all(width: 1.0, color: const Color(0xffff0000)),
          //     ),
          //   ),
          // ),
          Pinned.fromPins(
            Pin(start: 22.0, end: 22.0),
            Pin(size: 530.0, middle: 0.4419),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: const Color(0xffffffff),
                border: Border.all(width: 1.0, color: const Color(0xffff0000)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 113.0, middle: 0.5016),
            Pin(size: 36.0, middle: 0.2697),
            child: Text(
              'SIGN IN',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 30,
                color: const Color(0xff707070),
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 52.0, end: 51.0),
            Pin(size: 47.0, middle: 0.3595),
            // child: Container(
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(25.0),
            //     color: const Color(0xffffffff),
            //     border: Border.all(width: 1.0, color: const Color(0xff707070)),
            //   ),
            // ),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: "Email",
                fillColor: Color(0xffff0000)
              ),
              keyboardType: TextInputType.emailAddress,
              
            ),
          ),
          Pinned.fromPins(
            Pin(start: 52.0, end: 51.0),
            Pin(size: 47.0, middle: 0.43),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: const Color(0xffffffff),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 114.0, middle: 0.5),
            Pin(size: 35.0, middle: 0.5376),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 67.0, middle: 0.5014),
            Pin(size: 23.0, middle: 0.5371),
            child: Text(
              'LOG IN',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 20,
                color: const Color(0xff707070),
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
