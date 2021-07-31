// import 'package:firebase_registera_and_login/RegistrationPage.dart';
// import 'package:firebase_registera_and_login/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'homePage.dart';
import 'homePage.dart';
import 'homePage.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String _email, _password;

  // Future<void> login() async {
  //   final formstate = formkey.currentState;
  //
  //   if (formstate.validate()) {
  //     formstate.save();
  //     FirebaseUser loginUser = await FirebaseAuth.instance
  //         .signInWithEmailAndPassword(email: _email, password: _password);
  //     Navigator.pop(context);
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => Homepage()));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffbf0707),
      body: Stack(
        children: [
          //For Logo White Background
          Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  ),
                  color: Colors.white)),
          //For Logo Image
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 45),
                child: Center(
                  child: Image(
                    image: AssetImage("asset/logo.png"),
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
              //For Sign In Layout White Background
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 100),
                //the White Container
                child: Container(
                  // height: 300,
                  // width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                    color: Colors.white,
                    border: Border.all(width: 1, color: Colors.black),
                  ),
                  //The Sign in text
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Text(
                          "SIGN IN",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      //Email Edit Text
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 15, right: 15, top: 20),
                        child: TextFormField(
                          decoration: InputDecoration(hintText: "Email"),
                        ),
                      ),
                      //Password Edit Text
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 15, right: 15, top: 20),
                        child: TextFormField(
                          decoration: InputDecoration(hintText: "Password"),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(right: 15, top: 10),
                        child: Row(
                          children: [
                            const Expanded(child: SizedBox()),
                            Text(
                              "Forgot Password?",
                            ),
                          ],
                        ),
                      ),
                      //The login Button
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: ElevatedButton(
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => homePage()));
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xffee0b0b)),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    side: BorderSide(color: Color(0xffbf0707))),
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30, top: 5),
                        child: ElevatedButton(
                            onPressed: null,
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xffee0b0b)),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      side:
                                          BorderSide(color: Color(0xffbf0707))),
                                )),
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                thickness: 1,
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "Or Sign In With ",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              //Circle Social buttons
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(CircleBorder()),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                      ),
                      onPressed: null,
                      child: Image(
                        height: 45,
                        width: 45,
                        image: AssetImage("asset/fblogo.png"),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(CircleBorder()),
                        padding: MaterialStateProperty.all(EdgeInsets.all(5)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                      ),
                      onPressed: null,
                      child: Image(
                        height: 35,
                        width: 35,
                        image: AssetImage("asset/google.png"),
                      ),
                    ),
                  ],
                ),
              )
              //Sign Up Layout/container
              // Padding(
              //   padding: const EdgeInsets.only( left: 20, right: 20),
              //   child: Container(
              //     height: 01,
              //     width: MediaQuery.of(context).size.width,
              //     decoration: BoxDecoration(
              //         color: Colors.white,
              //         borderRadius: BorderRadius.only(
              //             bottomRight: Radius.circular(25),
              //             bottomLeft: Radius.circular(25)),
              //         border: Border.all(width: 1, color: Colors.black)),
              //   ),
              // )
            ],
          )
        ],
      ),

      // appBar: AppBar(
      //   title: Center(child: Text("Login Page")),
      //   backgroundColor: Colors.red,
      // ),
      // body: Form(
      //   key: formkey,
      //   child: Column(
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.all(15.0),
      //         child: TextFormField(
      //           decoration: InputDecoration(hintText: "Email"),
      //           keyboardType: TextInputType.emailAddress,
      //           onSaved: (input) {
      //             _email = input;
      //           },
      //           validator: (input) {
      //             if (input.isEmpty) {
      //               return "Email cannot be empty.";
      //             }
      //             return null;
      //           },
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.only(left: 15, right: 15, bottom: 80),
      //         child: TextFormField(
      //           decoration: InputDecoration(hintText: "Password"),
      //           obscureText: true,
      //           onSaved: (input) {
      //             _password = input;
      //           },
      //           validator: (input) {
      //             if (input.length < 6) {
      //               return "Password should be at least 6 characters long.";
      //             }
      //             return null;
      //           },
      //         ),
      //       ),
      //       FlatButton(
      //         color: Colors.red,
      //         onPressed: () {
      //           setState(() {
      //             //login();
      //           });
      //         },
      //         child: Text(
      //           "Login",
      //           style:
      //               TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      //         ),
      //       ),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           Text("Don't have an account?"),
      //           SizedBox(
      //             width: 10,
      //           ),
      //           GestureDetector(
      //             onTap: () {
      //               Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                       //builder: (context) => RegistrationPage())
      //               ));
      //             },
      //             child: Text(
      //               "Sign up",
      //               style: TextStyle(color: Colors.red),
      //             ),
      //           ),
      //         ],
      //       ),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           Text("Or, Sign in with"),
      //           SizedBox(
      //             height: 20,
      //           )
      //         ],
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
