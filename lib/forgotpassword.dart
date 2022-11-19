import 'package:flutter/material.dart';
import 'package:seminar_hall_booking/authdetails.dart';
import 'package:seminar_hall_booking/loginpage.dart';
import 'package:seminar_hall_booking/services.dart';
import 'package:seminar_hall_booking/startpage.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController _emailController = TextEditingController();
  AuthService _auth = AuthService();

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
                height: height*0.10,
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
                      Text('Forgot Password '.toUpperCase(),
                        style: TextStyle(
                          fontSize: 35,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Alegreya',
                        ),
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      Text(
                        'Please Enter the valid Email address',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                            ),
                            prefixIcon: Icon(
                              Icons.email,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 50,
                          width: 130,
                          child: RaisedButton(
                            color: Colors.deepPurple,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            onPressed: () async {
                              if(_emailController.text.isNotEmpty){
                              _auth.resetPasswordWithEmail(_emailController.text.trim());
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => StartPage(),
                                ),
                              );
                              }
                              else{
                                showDialog(context: context,
                                  builder: (context) => AlertDialog(
                                    title: Padding(
                                      padding: const EdgeInsets.fromLTRB(5,10,5,0),
                                      child: Center(
                                        child: Text(
                                          'oops!..Enter the valid email..',
                                          style: TextStyle(
                                            fontFamily: 'Alegreya',
                                            fontWeight: FontWeight.bold,
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
                                          fontFamily: 'Alegreya',
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
                            elevation: 10,
                            child: Text('Confirm',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
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
      ),
    );
  }
}
