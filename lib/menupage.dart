import 'package:seminar_hall_booking/Aboutus.dart';
import 'package:flutter/material.dart';
import 'package:seminar_hall_booking/helpCenter.dart';
import 'package:seminar_hall_booking/myprofile.dart';
import 'package:seminar_hall_booking/startpage.dart';
import 'model/user.dart';

class MenuPage extends StatefulWidget {
  final UserModel userData;

  const MenuPage(this.userData);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: height*0.1,
              ),
              Container(
                margin: EdgeInsets.only(top: 30.5),
                height: height * 0.85,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      SizedBox(
                          height:8,
                      ),
                      Text('Menu '.toUpperCase(),
                        style: TextStyle(
                          fontFamily: 'Alegreya',
                          fontSize: 40,
                          fontWeight: FontWeight.bold
                        ),),
                      SizedBox(
                        height:15
                      ),
                      Container(
                        height: 1,
                        width: 300,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Icon(
                              Icons.person,
                              size: 30,
                            ),
                            FlatButton(
                              splashColor:Colors.grey ,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyProfile(widget.userData),
                                  ),
                                );
                              },
                              child: Text(
                                ' My profile',
                                style: TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Icon(
                              Icons.info_outline_rounded,
                              size: 30,
                            ),
                            FlatButton(
                              splashColor:Colors.grey ,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AboutUsPage(),
                                  ),
                                );
                              },
                              child: Text(
                                ' About Us',
                                style: TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Icon(
                              Icons.help_outline_rounded,
                              size: 30,
                            ),
                            FlatButton(
                              splashColor:Colors.grey ,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HelpPage(),
                                  ),
                                );
                              },
                              child: Text(
                                ' Help Center',
                                style: TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StartPage(),
                            ),
                          );
                        },
                        child: Text(
                          'Log Out',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        color: Colors.deepPurple,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
