import 'package:flutter/material.dart';
import 'package:shonjibon/SignupPage2.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    var _StepCounter = 1;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black,),
        elevation: 0,
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
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24.0),
                          //color: const Color(0xffe50000),
                          border: Border.all(width: 2.0, color: Colors.black),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              Text("SIGN UP",
                                  style: TextStyle(
                                    fontFamily: 'Arial_Rounded_MT_Bold',
                                    fontSize: 20,
                                    color: Color(0xffd60000),
                                  )),
                              SizedBox(
                                height: 50,
                              ),
                              TextFormField(
                                decoration: InputDecoration(hintText: "Name"),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              TextFormField(
                                decoration: InputDecoration(hintText: "Email"),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              TextFormField(
                                decoration:
                                    InputDecoration(hintText: "Mobile No."),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              TextFormField(
                                decoration:
                                    InputDecoration(hintText: "Password"),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    hintText: "Re-Type Password"),
                              ),
                              SizedBox(
                                height: 90,
                              ),
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
                SizedBox(
                  width: 300,
                  child: ElevatedButton(
                      onPressed: () {
                        _StepCounter++;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupPage2()));
                      },
                      child: Text(
                        "NEXT",
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
              ],
            )),
      ),
    );
  }
}
