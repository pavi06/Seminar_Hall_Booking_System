import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:seminar_hall_booking/menupage.dart';
import 'package:seminar_hall_booking/startpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Landing(),
    );
  }
}

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: SafeArea(
            child: FutureBuilder<Object>(
              future: Firebase.initializeApp(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return StartPage();
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error!',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                      fontFamily: 'Pacifico',
                    ),
                    ),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ),
    );
  }
}
