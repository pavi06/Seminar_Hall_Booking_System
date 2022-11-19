import 'package:flutter/material.dart';
import 'package:seminar_hall_booking/services.dart';
import 'model/seminar_hall.dart';
import 'package:toggle_switch/toggle_switch.dart';

class DetailPage extends StatefulWidget {
  final Seminar seminarData;

  const DetailPage(this.seminarData);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  FirebaseServices _fbService = FirebaseServices();
  TextEditingController _event = TextEditingController();
  TextEditingController _bookedPerson = TextEditingController();
  String ValueChoose;
  List listItem = ['FN', 'AN'];

  @override
  Widget build(BuildContext context) {
    //var text = widget.seminarData.isBooked ? 'Booked' : 'Book Now';
    var height = MediaQuery.of(context).size.height;
    var textColor = widget.seminarData.status == 'Booked'
        ? Colors.red
        : widget.seminarData.status == 'Book Now'
            ? Colors.green
            : Colors.amber;

    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height * 0.1,
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
              width: double.infinity,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Details'.toUpperCase(),
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Alegreya',
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Container(
                        width: 400,
                        height: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                          color: Colors.white,
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          color: Colors.black54, width: 3.0),
                                      left: BorderSide(
                                          color: Colors.black54, width: 3.0),
                                      right: BorderSide(
                                          color: Colors.black54, width: 3.0),
                                      top: BorderSide(
                                          color: Colors.black54, width: 3.0),
                                    ),
                                  ),
                                  child: Image.asset(
                                    widget.seminarData.image,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Hall Name:   ' + widget.seminarData.name,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'RobotoSlab',
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(18, 0, 0, 0),
                                  child: Text(
                                    'Hall Capacity:   ' +
                                        widget.seminarData.capacity.toString(),
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'RobotoSlab',
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                (widget.seminarData.status == 'Request Sent' ||
                                        widget.seminarData.status == 'Booked')
                                    ? Text(
                                        'Session: ' +
                                            ((widget.seminarData.session) == 0
                                                ? "Forenoon Session"
                                                : "Afternoon session"),
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'RobotoSlab',
                                        ),
                                      )
                                    : Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                68, 0, 0, 0),
                                            child: Text(
                                              'Session:   ',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontFamily: 'RobotoSlab',
                                              ),
                                            ),
                                          ),
                                          ToggleSwitch(
                                            initialLabelIndex:
                                                widget.seminarData.session,
                                            onToggle: (val) {
                                              widget.seminarData.session = val;
                                            },
                                            labels: ['FN', 'AN'],
                                            fontSize: 20,
                                            cornerRadius: 10,
                                            activeBgColor: Colors.deepPurple,
                                          ),
                                        ],
                                      ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(17, 0, 17, 0),
                                  child: (widget.seminarData.status ==
                                              'Request Sent' ||
                                          widget.seminarData.status == 'Booked')
                                      ? Text(
                                          'Booked Person: ' +
                                              widget.seminarData.bookedPerson,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontFamily: 'RobotoSlab',
                                          ),
                                        )
                                      : TextField(
                                          controller: _bookedPerson,
                                          decoration: InputDecoration(
                                            prefixIcon: Icon(Icons.person),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                            labelText: 'Booked Person ',
                                          ),
                                        ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: (widget.seminarData.status ==
                                              'Request Sent' ||
                                          widget.seminarData.status == 'Booked')
                                      ? Text(
                                          'Event: ' +
                                              widget.seminarData.event,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontFamily: 'RobotoSlab',
                                          ),
                                        )
                                      : TextField(
                                          controller: _event,
                                          decoration: InputDecoration(
                                            prefixIcon: Icon(Icons.event),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                            labelText: 'Event ',
                                          ),
                                        ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: RaisedButton(
                                        color: Colors.deepPurpleAccent,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Text(
                                          widget.seminarData.status,
                                          style: TextStyle(
                                            fontSize: 21,
                                            color: textColor,
                                          ),
                                        ),
                                        onPressed: widget.seminarData.isBooked
                                            ? null
                                            : () async {
                                                if (_event.text.isNotEmpty &&
                                                    _bookedPerson
                                                        .text.isNotEmpty) {
                                                  widget.seminarData.status =
                                                      'Request Sent';
                                                  widget.seminarData.event =
                                                      _event.text;
                                                  widget.seminarData
                                                          .bookedPerson =
                                                      _bookedPerson.text;

                                                  await _fbService.updateData(
                                                      widget.seminarData);
                                                  setState(() {
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) =>
                                                          AlertDialog(
                                                        title: Text(
                                                          'Your request for booking has sent successfully...',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Alegreya',
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold,
                                                            color: Colors.red,
                                                          ),
                                                        ),
                                                        actions: [
                                                          RaisedButton(
                                                            color: Colors
                                                                .deepPurpleAccent,
                                                            child: Text(
                                                              'Ok',
                                                              style:
                                                                  TextStyle(
                                                                fontFamily:
                                                                    'Alegreya',
                                                              ),
                                                            ),
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                          ),
                                                        ],
                                                        elevation: 15,
                                                      ),
                                                    );
                                                  });
                                                } else {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) =>
                                                        AlertDialog(
                                                      title: Center(
                                                        child: Text(
                                                          '    Warning!!\n\n Enter all details..',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Alegreya',
                                                            color: Colors.red,
                                                          ),
                                                        ),
                                                      ),
                                                      actions: [
                                                        RaisedButton(
                                                          color: Colors
                                                              .deepPurpleAccent,
                                                          child: Text(
                                                            'Ok',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Alegreya',
                                                            ),
                                                          ),
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                        ),
                                                      ],
                                                      elevation: 15,
                                                    ),
                                                  );
                                                }
                                              },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: RaisedButton(
                                            color: Colors.deepPurpleAccent,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            child: Text(
                                              'Cancel',
                                              style: TextStyle(
                                                fontSize: 21,
                                                color: Colors.white,
                                              ),
                                            ),
                                            onPressed: () async {
                                              widget.seminarData.status =
                                                  "Book Now";
                                              widget.seminarData.event = "";
                                              widget.seminarData.bookedPerson =
                                                  "";
                                              widget.seminarData.isBooked =
                                                  false;
                                              widget.seminarData.session = 1;

                                              await _fbService.updateData(
                                                  widget.seminarData);
                                              setState(() {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      AlertDialog(
                                                    title: Text(
                                                      'Your cancellation process has been done successfully...',
                                                      style: TextStyle(
                                                        fontFamily: 'Alegreya',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                    actions: [
                                                      RaisedButton(
                                                        color: Colors
                                                            .deepPurpleAccent,
                                                        child: Text(
                                                          'Ok',
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                          ),
                                                        ),
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      ),
                                                    ],
                                                    elevation: 15,
                                                  ),
                                                );
                                              });
                                            }),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
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
    );
  }
}
