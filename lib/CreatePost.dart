import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shonjibon/homePage.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key key}) : super(key: key);

  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  TextEditingController BloodRequestPostController = TextEditingController();

  String BloodGroupChoose;
  List BloodGroupList = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];

  var userID = 0;
  String currentUserName = "Current User Name";
  var post, location, bloodType;

  @override
  Widget build(BuildContext context) {
    getCurrentUserDetails();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffee0b0b),
        title: Text("Create Post"),
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("asset/profilepic.jpg")),
                      shape: BoxShape.circle,
                      color: Colors.black),
                ),
              ),
              Text(
                currentUserName,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: TextField(
                  controller: BloodRequestPostController,
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  maxLines: 20,
                  decoration: InputDecoration(
                      hintText: "How can we help you?",
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 3.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.red, width: 1.0))),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(
                    iconEnabledColor: Colors.red,
                    style: TextStyle(color: Colors.red),
                    focusColor: Color(0xffee0b0b),
                    hint: Text("Set Blood Type"),
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
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xffee0b0b))),
                      onPressed: null,
                      child: Text(
                        "Set Location",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xffee0b0b))),
                  onPressed: () {
                    postBloodRequest();
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                  child: Text(
                    "POST",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  )),
            ],
          )
        ],
      ),
    );
  }

  postBloodRequest() async {
    var url = "http://localhost:3300/post_blood_request";
    bloodType = BloodGroupChoose;
    post = BloodRequestPostController.text;
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'userID': userID.toString(),
        'post': post,
        'location': location,
        'bloodType': bloodType,
      }),
    );
  }

  Future<void> getCurrentUserDetails() async {
    userID = homePage.userID;
    currentUserName = homePage.fullName;

    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // userID = prefs.getInt("CurrentUserID");
    // currentUserName = prefs.getString("CurrentUserName");
    // return currentUserName;
  }
}
