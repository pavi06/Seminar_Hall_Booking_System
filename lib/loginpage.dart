import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:seminar_hall_booking/authdetails.dart';
import 'package:seminar_hall_booking/forgotpassword.dart';
import 'package:seminar_hall_booking/hallpage.dart';
import 'package:seminar_hall_booking/services.dart';

import 'model/user.dart';

class Loginpage extends StatefulWidget {
  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  AuthService _auth = AuthService();
  final FirebaseServices firebaseServices = FirebaseServices();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool _secureText = true;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.arrow_forward_sharp),
        onPressed: () async {
          if (_passwordController.text.isNotEmpty &&
              _emailController.text.isNotEmpty) {
            User newUser = await _auth.signInWithEmail(
                _emailController.text.toString(),
                _passwordController.text.toString());
            if (newUser != null) {
              print('User not null');
              UserModel loggedUser = await firebaseServices
                  .getUser(_emailController.text.toString());
              if (loggedUser != null) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HallPage(loggedUser),
                  ),
                );
              }
            } else {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Padding(
                    padding: const EdgeInsets.fromLTRB(5,10,5,0),
                    child: Center(
                      child: Text(
                        '   Warning!!..\nWrong Password',
                        style: TextStyle(
                          fontFamily: 'Algereya',
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  actions: [
                    RaisedButton(
                      color:Colors.deepPurpleAccent,
                      child: Text(
                        'Ok',
                        style: TextStyle(
                          fontFamily: 'Algereya',
                          fontWeight: FontWeight.bold,
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
          } else {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Padding(
                  padding: const EdgeInsets.fromLTRB(5,10,5,0),
                  child: Center(
                    child: Text(
                      '  Warning !..\nEnter all details..',
                      style: TextStyle(
                        fontFamily: 'Algereya',
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                actions: [
                  RaisedButton(
                    color:Colors.deepPurpleAccent,
                    child: Text(
                      'Ok',
                      style: TextStyle(
                        fontFamily: 'Algereya',
                        fontWeight: FontWeight.bold,
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
          children: [
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
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'Login'.toUpperCase(),
                      style: TextStyle(
                        fontSize: 45,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Alegreya',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage('images/signinavatar.jpg'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _passwordController,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.remove_red_eye_sharp),
                        onPressed: () {
                          setState(() {
                            _secureText = !_secureText;
                          });
                        },
                      ),
                      labelText: 'Password ',
                    ),
                    obscureText: _secureText,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResetPassword(),
                        ),
                      );
                    },
                    child: Text(
                      'Forget password ?',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Alegreya',
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
