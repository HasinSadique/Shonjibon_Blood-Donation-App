import 'package:flutter/material.dart';
import 'package:shonjibon/SignupPage2.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import 'User.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController NameController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController MobileController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  TextEditingController ReTypePasswordController = TextEditingController();

  String _Name, _Email, _Mobile, _Password, _RetypePassword;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var _StepCounter = 1;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        elevation: 0,
        title: Center(
          child: Text(
            "SHONJIBON",
            style: TextStyle(
                fontFamily: 'Arial_Rounded_MT_Bold',
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xffd60000)),
          ),
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
      ),
      body: Center(
        child: Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                    width: 180,
                    height: 70,
                    child: StepProgressIndicator(
                      totalSteps: 3,
                      currentStep: _StepCounter,
                      size: 6,
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
                          child: Form(
                            key: _formKey,
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
                                  height: 30,
                                ),
                                TextFormField(
                                    decoration:
                                        InputDecoration(hintText: "Name"),
                                    keyboardType: TextInputType.text,
                                    controller: NameController,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "Enter Name";
                                      }
                                      return null;
                                    }),
                                SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                    decoration:
                                        InputDecoration(hintText: "Email"),
                                    keyboardType: TextInputType.emailAddress,
                                    controller: EmailController,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "Enter your email address";
                                      }
                                      return null;
                                    }),
                                SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                    decoration:
                                        InputDecoration(hintText: "Mobile No."),
                                    keyboardType: TextInputType.number,
                                    controller: MobileController,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "Enter your mobile number";
                                      }
                                      return null;
                                    }),
                                SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                    decoration:
                                        InputDecoration(hintText: "Password"),
                                    keyboardType: TextInputType.text,
                                    controller: PasswordController,
                                    obscureText: true,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "Enter password";
                                      }
                                      return null;
                                    }),
                                SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "Re-Type Password"),
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                  controller: ReTypePasswordController,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Enter same password again";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                SizedBox(
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () {
                      _StepCounter++;
                      _Name = NameController.text;
                      _Email = EmailController.text;
                      _Mobile = MobileController.text;
                      _Password = PasswordController.text;
                      _RetypePassword = ReTypePasswordController.text;
                      if (_formKey.currentState.validate() &&
                          _Password == _RetypePassword) {
                        final snackBar = SnackBar(
                          content: Text("Processing..."),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        //Make a User Object and store info;
                        User user = new User();
                        user.Fullname = _Name;
                        user.Email = _Email;
                        user.Mobile = _Mobile;
                        user.Password = _Password;
                        //Take that object to next Screen;
                        print("Name: " + _Name + "\nEmail: " + _Email);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupPage2(user: user)));
                      } else {}
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
