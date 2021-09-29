// import 'package:firebase_registera_and_login/RegistrationPage.dart';
// import 'package:firebase_registera_and_login/homepage.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shonjibon/SignUp.dart';
import 'package:http/http.dart' as http;

import 'homePage.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  redirectUI() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    if (token != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => homePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffbf0707),
      body: Stack(
        children: [
          //For Logo White Background
          Container(
              // width: MediaQuery.of(context).size.width,
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
                  child: Form(
                    key: _formkey,
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
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 20),
                          child: TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(hintText: "Email"),
                            onChanged: (value) {},
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Enter login email";
                              }
                              return null;
                            },
                          ),
                        ),
                        //Password Edit Text
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 20),
                          child: TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(hintText: "Password"),
                            onChanged: (value) {},
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Enter password";
                              }
                              return null;
                            },
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
                              setState(() {
                                if (_formkey.currentState.validate()) {
                                  loginUsingEmailAndPassword(
                                      _emailController.text,
                                      _passwordController.text);
                                }
                              });
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xffee0b0b)),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      side:
                                          BorderSide(color: Color(0xffbf0707))),
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30, top: 5),
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUp()));
                              },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color(0xffee0b0b)),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        side: BorderSide(
                                            color: Color(0xffbf0707))),
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
            ],
          )
        ],
      ),
    );
  }

  loginUsingEmailAndPassword(String email, String password) async {
    // print("Logging in with \nemail:" + email + "\nand Password: " + password);
    var url = "http://localhost:3000/login";
    final http.Response response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    var parse = jsonDecode(response.body);
    if (parse["error"] == 401) {
      final snackBar =
          SnackBar(content: Text("Incorrect Username or Password."));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (parse["error"] == 403) {
      final snackBar = SnackBar(content: Text("Incorrect Password."));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (parse["token"] != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', parse["token"]);
      redirectUI();
    }
  }
}
