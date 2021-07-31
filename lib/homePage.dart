import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  const homePage({Key key}) : super(key: key);

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
              ),
              ListTile(
                leading: Image(
                  image: AssetImage("asset/education_icon.png"),
                  height: 30,
                ),
                title: Text(
                  "Education",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                leading: Image(
                  image: AssetImage("asset/project_logo.png"),
                  height: 30,
                  width: 30,
                ),
                title: Text(
                  "Projects",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      appBar: AppBar(
        backgroundColor: Color(0xffee0b0b),
        title: Text("Shonjibon"),
        centerTitle: true,
        actions: [Image(image: AssetImage("asset/msg.png"))],
      ),
      body: Container(
      ),

    );
  }
}
