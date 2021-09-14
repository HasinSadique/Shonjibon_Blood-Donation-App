import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shonjibon/LoginPage.dart';
import 'SignupPage2.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import 'User.dart';

class SignupPage3 extends StatefulWidget {
  User user;

  SignupPage3({Key key, this.user}) : super(key: key);

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
    User CurrentUser = widget.user;

    // print(CurrentUser.Fullname + "'s Age is " + CurrentUser.Age);
    // print("And Last Donated " +
    //     CurrentUser.LastBloodDonationDate +
    //     ".\nAlso " +
    //     CurrentUser.Vaccinated +
    //     " is the Vaccination status.");

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
                  height: 60,
                  child: StepProgressIndicator(
                    totalSteps: 3,
                    currentStep: _StepCounter,
                    size: 8,
                    roundedEdges: Radius.circular(25),
                    selectedColor: Color(0xffd60000),
                  )),
              Padding(
                padding: const EdgeInsets.all(18),
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.0),
                        //color: const Color(0xffe50000),
                        border: Border.all(width: 1.5, color: Colors.black),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, right: 15, top: 20, bottom: 30),
                        child: Column(
                          children: [
                            Text("Review & submit",
                                style: TextStyle(
                                  fontFamily: 'Arial_Rounded_MT_Bold',
                                  fontSize: 20,
                                  color: Color(0xffd60000),
                                )),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Name: ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        CurrentUser.Fullname,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Email Address: ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        CurrentUser.Email,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Mobile: ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        CurrentUser.Mobile,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Gender: ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        CurrentUser.Gender,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Age: ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        CurrentUser.Age,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Blood Group: ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        CurrentUser.BloodGroup,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Last Donation Date: ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        CurrentUser.LastBloodDonationDate,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Smoker: ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        CurrentUser.Smoker,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Vaccinated: ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        CurrentUser.Vaccinated,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
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
                      onPressed: () {
                        //Go to Login Page
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
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
