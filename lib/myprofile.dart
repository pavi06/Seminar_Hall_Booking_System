import 'package:flutter/material.dart';

import 'model/user.dart';

class MyProfile extends StatelessWidget {
  final UserModel userData;

  const MyProfile(this.userData);

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SingleChildScrollView(
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
                  child: Column(
                    children:[
                      SizedBox(
                      height: 10,
                    ),
                    Text('My Profile '.toUpperCase(),
                      style: TextStyle(
                        fontFamily: 'Alegreya',
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 35,
                      ),),
                      SizedBox(
                        height: 10,
                      ),
                    Container(
                      height: 1,
                      color: Colors.grey,
                      width: 300,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 80,
                        backgroundImage: AssetImage('images/usericon.jpg'),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name : ' + userData.name.toString(),
                              style: TextStyle(
                                fontFamily: 'Lobster',
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Email address : ' + userData.email,
                              style: TextStyle(
                                fontFamily: 'Lobster',
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Phone number : ' + userData.phoneNo.toString(),
                              style: TextStyle(
                                fontFamily: 'Lobster',
                                fontSize: 20,
                              ),
                            ), //+ widget
                          ],
                        ),
                      ),
                    ),
                  ],
            ),
    ),
          ],
        ),
      ),
    );
  }
}
