import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shonjibon/CreatePost.dart';

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
            Container(
              height: 180,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xffee0b0b), Color(0xFF8D0C0C)]),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("asset/profilepic.jpg")),
                          shape: BoxShape.circle,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Hasin Sadique",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.favorite,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "15",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "15.5",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.black,
              ),
              title: Text(
                "Settings",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.black,
              ),
              title: Text(
                "Logout",
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
        actions: [
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xffee0b0b))),
            onPressed: () {
              setState(() {
                message(context);
              });
            },
            child: Icon(
              Icons.message,
              color: Colors.white,
            ),
            // child: Image(
            //     height: 35, width: 40, image: AssetImage("asset/msg.png"))
          ),
        ],
      ),
      body: Container(
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: TabBar(
              indicatorColor: Color(0xffee0b0b),
              tabs: [
                Tab(
                  child: Text(
                    "News Feed",
                    style: TextStyle(color: Colors.black),
                  ),
                  icon: Icon(
                    Icons.article,
                    color: Color(0xffee0b0b),
                  ),
                ),
                Tab(
                    child: Text(
                      "Notifications",
                      style: TextStyle(color: Colors.black),
                    ),
                    icon: Icon(
                      Icons.notifications,
                      color: Color(0xffee0b0b),
                    )),
              ],
            ),
            body: TabBarView(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xffee0b0b))),
                        onPressed: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CreatePost()));
                          });
                        },
                        child: Text(
                          "Post Blood Request",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
                Column(
                  children: [Text("Notifications")],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  message(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Hello Ji, Pore Kotha Hobe. Bye"),
    ));
  }
}
