import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:seminar_hall_booking/authdetails.dart';
import 'package:seminar_hall_booking/hallpage.dart';
import 'package:seminar_hall_booking/model/user.dart';
import 'package:seminar_hall_booking/services.dart';

class Registerationpage extends StatefulWidget {
  @override
  _RegisterationpageState createState() => _RegisterationpageState();
}

class _RegisterationpageState extends State<Registerationpage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _phoneNoController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  AuthService _auth = AuthService();
  final FirebaseServices firebaseServices = FirebaseServices();

  @override
  void dispose() {
    _emailController.dispose();
    _userNameController.dispose();
    _phoneNoController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  FlutterLocalNotificationsPlugin localNotification;

  @override
  void initstate() {
    super.initState();
    var androidInitialize = new AndroidInitializationSettings('ic_lancher');
    var ioSInitialize = new IOSInitializationSettings();
    var initializationSetting = new InitializationSettings(
        android: androidInitialize, iOS: ioSInitialize);
    localNotification = new FlutterLocalNotificationsPlugin();
    localNotification.initialize(initializationSetting);
  }

  void showNotification() async {
    var androidDetails = new AndroidNotificationDetails(
        "channelId",
        "Local Notification ",
        ''' content''',
        importance: Importance.high);
    var iosDetails = new IOSNotificationDetails();
    var generalNotificationDetails =
        new NotificationDetails(android: androidDetails, iOS: iosDetails);
    await localNotification.show(
        0, "Seminar App", '''Hi there! Your Registration have been done Successfull !!
        Have a happy journey with us..''', generalNotificationDetails);
  }

  bool _secureText = true;

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        hoverColor: Colors.deepPurpleAccent,
        child: Icon(Icons.arrow_forward_sharp),
        onPressed: () async {
          if (_passwordController.text.isNotEmpty &&
              _userNameController.text.isNotEmpty &&
              _phoneNoController.text.isNotEmpty &&
              _emailController.text.isNotEmpty) {
            User newUser = await _auth.createWithEmail(
                _emailController.text.toString(),
                _passwordController.text.toString());
            if (newUser != null) {
              print('User not null');
              UserModel newUserModel = new UserModel(
                uid: newUser.uid,
                name: _userNameController.text.toString(),
                phoneNo: _phoneNoController.text.toString(),
                email: _emailController.text.toString(),
              );
              await firebaseServices.addUser(newUserModel);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HallPage(newUserModel),
                ),
              );
              showNotification();
            } else {
              print('User  null');
            }
          } else {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Padding(
                  padding: const EdgeInsets.fromLTRB(5,10,5,0),
                  child: Center(
                    child: Text("     Warning!!\nEnter All Details..",
                      style: TextStyle(
                        fontFamily: 'Algereya',
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                actions: [
                  RaisedButton(
                    color:Colors.deepPurpleAccent,
                    child: Text('Ok',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Algereya',
                    ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
                elevation: 15,
              ),
            );
          }
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children:[
            Container(
          height: height * 0.10,
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
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Sign up'.toUpperCase(),
                    style: TextStyle(
                      fontFamily: 'Alegreya',
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage('images/usericon.jpg'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextField(
                      controller: _userNameController,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person_outline_sharp),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        labelText: 'UserName',
                        labelStyle: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        labelStyle: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextField(
                      controller: _phoneNoController,
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.call),
                        labelText: 'PhoneNumber',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        labelStyle: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextField(
                      controller: _passwordController,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.remove_red_eye_sharp),
                          onPressed: () {
                            setState(() {
                              _secureText = !_secureText;
                            });
                          },
                        ),
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        labelStyle: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }
}
