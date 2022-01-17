import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shonjibon/Album.dart';
import 'package:shonjibon/CreatePost.dart';
import 'package:shonjibon/LoginPage.dart';
import 'package:shonjibon/User.dart';

import 'MyProfile.dart';
import 'Users.dart';
import 'VideoCall.dart';

class homePage extends StatefulWidget {
  static String fullName, userEmail, signedInUserToken;
  static int userID;

  String token;

  homePage({Key key, this.token}) : super(key: key);

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    // var bb = loadNewsFeed();
    getUserDetails(widget.token);

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
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyProfile()));
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("asset/profilepic.jpg")),
                            shape: BoxShape.circle,
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      homePage.fullName,
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
                Icons.article,
                color: Colors.black,
              ),
              // leading: Image(
              //   image: AssetImage("asset/posts.png"),
              // ),
              title: Text(
                "My Posts",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              onTap: () {
                LogOutUser();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => VideoCall()));
              },
              leading: Icon(
                Icons.settings,
                color: Colors.black,
              ),
              title: Text(
                "Video Call",
                style: TextStyle(fontWeight: FontWeight.bold),
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
              onTap: () {
                LogOutUser();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              leading: Icon(
                Icons.logout,
                color: Colors.black,
              ),
              title: Text(
                "Log out",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xffee0b0b),
        title: Text("Home"),
        centerTitle: false,
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
                        )),
                    Container(
                      child: Card(
                        child: FutureBuilder(
                          future: getUserData(),
                          builder: (context, snapshot) {
                            if (snapshot.data == null) {
                              return Container(
                                height: 100,
                                width: 200,
                                child: Center(
                                  child: Text("Loading..."),
                                ),
                              );
                            } else
                              return ListView.builder(
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(snapshot.data),
                                  );
                                },
                              );
                          },
                        ),
                      ),
                    )
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

  void LogOutUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("token");
  }

  getUserDetails(String token) async {
    //First check if localstorage is not empty
    //retrieve details from LStore
    //else decode JWT
    print("Decoding Token");
    Map<String, dynamic> decodedTOKEN = JwtDecoder.decode(token);
    // User signedInUser = new User();
    // _fullName = decodedTOKEN["fullname"];
    homePage.fullName = decodedTOKEN["fullname"];
    homePage.userEmail = decodedTOKEN["email"];
    homePage.userID = decodedTOKEN["id"];
    //set Current User Info in shared Preference
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('CurrentUserID', decodedTOKEN["id"]);
    await prefs.setString('CurrentUserName', decodedTOKEN["fullname"]);
    await prefs.setString('CurrentUserEmail', decodedTOKEN["email"]);
    //and store details in LStore

    // and then display.
    // print("Setting Full Name");
    // _fullName = signedInUser.Fullname;

    //Save in local storage
  }

  Future<List<Album>> getUserData() async {
    var response =
        await http.get(Uri.https('jsonplaceholder.typicode.com', 'users'));

    var jsonData = jsonDecode(response.body);
    List<Album> albums = [];

    for (var u in jsonData) {
      Album album = Album(u[''], u[''], u['']);
      albums.add(album);
    }
    print(albums.length);
    return albums;
  }

  // Future<http.Response> loadNewsFeed() async {
  //   var response = await http.get(Uri.parse('http://localhost:3300/users'));
  //   var jsonData = jsonDecode(response.body);
  //   List<Users> users = [];

  //   for (var item in jsonData) {
  //     Users user = Users(
  //         item['UserID'],
  //         item['Name'],
  //         item['Email'],
  //         item['Mobile'],
  //         item['Password'],
  //         item['Blood_Group'],
  //         item['Age'],
  //         item['Gender'],
  //         item['Smoker'],
  //         item['Vaccinated'],
  //         item['Is_Donor'],
  //         item['Last_Blood_Donated']);

  //     users.add(user);
  //   }
  //   // print("Total users: ");
  //   // print(users[0].userId);

  //   return users;
  // }
}
