import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffee0b0b),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 125,
                width: 125,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("asset/profilepic.jpg")),
                    shape: BoxShape.circle,
                    color: Colors.black),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Full Name",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 10,
              right: 10,
            ),
            child: SizedBox(
              height: 0.25,
              child: Container(
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 30,
              ),
              Icon(Icons.email),
              SizedBox(
                width: 20,
              ),
              Text("hasinsadique@gmail.com"),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 30,
              ),
              Icon(Icons.phone),
              SizedBox(
                width: 20,
              ),
              Text("+880 1766-620839"),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 30,
              ),
              Icon(Icons.email),
              SizedBox(
                width: 20,
              ),
              Text("hasinsadique@gmail.com"),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 30,
              ),
              Icon(Icons.phone),
              SizedBox(
                width: 20,
              ),
              Text("+880 1766-620839"),
            ],
          )
        ],
      ),
    );
  }
}
