import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'SignupPage2.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class SignupPage3 extends StatefulWidget {
  const SignupPage3({Key key}) : super(key: key);

  @override
  _SignupPage3State createState() => _SignupPage3State();
}

class _SignupPage3State extends State<SignupPage3> {
  String _Fullname,
      _Email,
      _Mobile,
      _Password,
      _BloodGroup,
      _Age,
      _Gender,
      _Smoker,
      _Vaccinated;

  @override
  Widget build(BuildContext context) {
    var _StepCounter = 3;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "SHONJIBON",
          style: TextStyle(
              fontFamily: 'Arial_Rounded_MT_Bold',
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color(0xffd60000)),
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                  width: 180,
                  height: 100,
                  child: StepProgressIndicator(
                    totalSteps: 3,
                    currentStep: _StepCounter,
                    size: 8,
                    roundedEdges: Radius.circular(25),
                    selectedColor: Color(0xffd60000),
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 35, right: 35),
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.0),
                        //color: const Color(0xffe50000),
                        border: Border.all(width: 2.0, color: Colors.black),
                      ),
                      child: Scrollbar(
                        child: Column(
                          children: [
                            Text("NAme"),
                            SizedBox(width: 20),
                            Text("Email"),
                            SizedBox(width: 20),
                            Text("Mobile"),
                            SizedBox(width: 20),
                            Text("Password"),
                            SizedBox(width: 20),
                            Text("Blood Group"),
                            SizedBox(width: 20),
                            Text("Age"),
                            SizedBox(width: 20),
                            Text("Gender"),
                            SizedBox(width: 20),
                            Text("Smoker"),
                            SizedBox(width: 20),
                            Text("Vaccinated"),
                            SizedBox(width: 20),
                            Text("Hobbies"),
                            SizedBox(width: 20),
                            Text("Life"),
                            SizedBox(width: 20),
                            Text("CGPa"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 50,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        _StepCounter++;
                        Navigator.pop(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupPage2()));
                      },
                      child: Text(
                        "PREVIOUS",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xffd60000))),
                    ),
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: null,
                      child: Text(
                        "SUBMIT",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xffd60000))),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
