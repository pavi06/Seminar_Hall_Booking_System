import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seminar_hall_booking/customtile.dart';
import 'package:seminar_hall_booking/menupage.dart';
import 'package:seminar_hall_booking/model/seminar_hall.dart';
import 'package:seminar_hall_booking/services.dart';
import 'model/user.dart';

class HallPage extends StatefulWidget {
  final UserModel userData;

  const HallPage(this.userData);

  @override
  _HallPageState createState() => _HallPageState();
}

class _HallPageState extends State<HallPage> {
  final FirebaseServices firebaseServices = FirebaseServices();
  List<Seminar> seminarList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Seminar Halls'.toUpperCase(),
          style: TextStyle(
            fontFamily: 'Alegreya',
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MenuPage(widget.userData),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.more_vert,
                size: 30,
              ),
            ),
          ),
        ],
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        child: StreamBuilder<List<Seminar>>(
          stream: firebaseServices.getDataList(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error! ${snapshot.error.toString()}'),
              );
            }

            if (snapshot.hasData) {
              seminarList = snapshot.data;
              //print('Length===='+seminarList.length.toString());
              return ListView.builder(
                itemCount: seminarList.length,
                itemBuilder: (context, int index) {
                  return CustomTile(seminarList[index]);
                },
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
