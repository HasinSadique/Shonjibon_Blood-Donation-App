import 'package:flutter/material.dart';
import 'package:shonjibon/SignUp.dart';
import 'package:shonjibon/SignupPage3.dart';
import 'package:shonjibon/User.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class SignupPage2 extends StatefulWidget {
  User user;

  SignupPage2({Key key, this.user}) : super(key: key);

  @override
  _SignupPage2State createState() => _SignupPage2State();
}

class _SignupPage2State extends State<SignupPage2> {
  String _selectedGender,
      _isSmoker,
      _BloodGroup,
      _Age,
      _LastBloodDonationDate,
      _isVaccinated,
      _WantsToDonated;

  final _formKey = GlobalKey<FormState>();
  TextEditingController _AgeController = TextEditingController();

  String Gender = "";
  String _Smoker = "";

  String BloodGroupChoose;
  List BloodGroupList = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];

  String Vaccinated;
  List VaccinationList = ['Yes', 'No', 'Partially'];

  DateTime _LastDonationDate;

  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    User currentUser = widget.user;
    // print(currentUser.Fullname+" This is second screen.");
    var _StepCounter = 2;
    String SelectDate = "SelectDate";
    if (_LastDonationDate != null) {
      SelectDate =
          "${_LastDonationDate.day}-${_LastDonationDate.month}-${_LastDonationDate.year}";
    }
    // var formattedDate = "${_LastDonationDate.day}-${_LastDonationDate.month}-${_LastDonationDate.year}";

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
                  height: 80,
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
                                height: 50,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: DropdownButton(
                                      hint: Text("Blood Group"),
                                      value: BloodGroupChoose,
                                      onChanged: (newValue) {
                                        setState(() {
                                          BloodGroupChoose = newValue;
                                        });
                                      },
                                      items: BloodGroupList.map((valueItem) {
                                        return DropdownMenuItem(
                                          value: valueItem,
                                          child: Text(valueItem),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: _AgeController,
                                      decoration:
                                          InputDecoration(hintText: "Age"),
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return "Enter your age.";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              //Gender and Smoker label
                              Row(
                                children: [
                                  Expanded(child: Text("Gender")),
                                  Expanded(child: Text("Do you Smoke?")),
                                ],
                              ),
                              //Gender and Smoker Radio
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Radio(
                                                value: "Male",
                                                groupValue: Gender,
                                                onChanged: (GenderValue) {
                                                  setState(() {
                                                    Gender = GenderValue;
                                                  });
                                                }),
                                            Text("Male"),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Radio(
                                                value: "Female",
                                                groupValue: Gender,
                                                onChanged: (GenderValue) {
                                                  setState(() {
                                                    Gender = GenderValue;
                                                  });
                                                }),
                                            Text("Female"),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Radio(
                                                value: "Other",
                                                groupValue: Gender,
                                                onChanged: (GenderValue) {
                                                  setState(() {
                                                    Gender = GenderValue;
                                                  });
                                                }),
                                            Text("Other"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Radio(
                                                value: "Yes",
                                                groupValue: _Smoker,
                                                onChanged: (GenderValue) {
                                                  setState(() {
                                                    _Smoker = GenderValue;
                                                  });
                                                }),
                                            Text("Yes"),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Radio(
                                                value: "No",
                                                groupValue: _Smoker,
                                                onChanged: (GenderValue) {
                                                  setState(() {
                                                    _Smoker = GenderValue;
                                                  });
                                                }),
                                            Text("No"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              //Last Donation date
                              Row(
                                children: [
                                  Expanded(
                                    child: Text("Last Blood Donated"),
                                  ),
                                  Expanded(
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.white)),
                                          onPressed: () {
                                            showDatePicker(
                                                    context: context,
                                                    initialDate:
                                                        _LastDonationDate ==
                                                                null
                                                            ? DateTime.now()
                                                            : _LastDonationDate,
                                                    firstDate: DateTime(2000),
                                                    lastDate: DateTime.now())
                                                .then((Date) {
                                              setState(() {
                                                _LastDonationDate = Date;
                                              });
                                            });
                                          },
                                          child: Text(
                                            _LastDonationDate == null
                                                ? 'Select Date'
                                                : SelectDate,
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ))),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text("Vaccinated?"),
                                  ),
                                  Expanded(
                                      child: DropdownButton(
                                    hint: Text("Vaccinated"),
                                    value: Vaccinated,
                                    onChanged: (newValue) {
                                      setState(() {
                                        Vaccinated = newValue;
                                      });
                                    },
                                    items: VaccinationList.map((valueItem) {
                                      return DropdownMenuItem(
                                        value: valueItem,
                                        child: Text(valueItem),
                                      );
                                    }).toList(),
                                  ))
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Checkbox(
                                          value: _checked,
                                          onChanged: (value) {
                                            setState(() {
                                              _checked = value;
                                            });
                                          }),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: Column(
                                    children: [
                                      Text(
                                          "Do you want to donate blood to save lives and join the cause?")
                                    ],
                                  ))
                                ],
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
                        Navigator.pop(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
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
                        _BloodGroup = BloodGroupChoose;
                        _Age = _AgeController.text;
                        _selectedGender = Gender;
                        _isSmoker = _Smoker;
                        _LastBloodDonationDate = SelectDate;
                        if (_LastBloodDonationDate == "SelectDate") {
                          _LastBloodDonationDate = "Never Donated";
                        }
                        _isVaccinated = Vaccinated;
                        if (_formKey.currentState.validate() &&
                            (_BloodGroup.isNotEmpty) &&
                            (_Age.isNotEmpty) &&
                            (_selectedGender.isNotEmpty) &&
                            (_isSmoker.isNotEmpty) &&
                            (_LastBloodDonationDate.isNotEmpty) &&
                            (_isVaccinated.isNotEmpty)) {
                          currentUser.BloodGroup = _BloodGroup;
                          currentUser.Age = _Age;
                          currentUser.Gender = _selectedGender;
                          currentUser.Smoker = _isSmoker;
                          currentUser.Vaccinated = _isVaccinated;
                          currentUser.LastBloodDonationDate =
                              _LastBloodDonationDate;
                          if (_checked == true) {
                            currentUser.WantsToDonated = "Yes";
                          } else {
                            currentUser.WantsToDonated = "No";
                          }

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignupPage3(
                                        user: currentUser,
                                      )));
                        }
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
