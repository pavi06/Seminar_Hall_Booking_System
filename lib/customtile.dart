import 'package:flutter/material.dart';
import 'package:seminar_hall_booking/halldetail.dart';
import 'package:seminar_hall_booking/model/seminar_hall.dart';

class CustomTile extends StatelessWidget {
  final Seminar seminarData;

  CustomTile(this.seminarData);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          height: 130,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                //bottom: 0,
                child: Card(
                  elevation: 8,
                  shadowColor: Colors.deepPurpleAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(seminarData),
                          ),
                        );
                      },
                      leading: Image.asset(
                        seminarData.image,
                      ),
                      title: Text(
                        seminarData.name,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      subtitle: Text(
                        'Capacity: '+seminarData.capacity.toString(),
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                right: 40,
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      seminarData.status,
                      style: TextStyle(
                        color: seminarData.isBooked ? Colors.red : Colors.green,
                        fontSize: 15,
                      ),
                    ),
                    color: Colors.deepPurpleAccent,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(seminarData),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
        // child: Card(
        //   clipBehavior: Clip.antiAlias,
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(15.0),
        //   ),
        //   shadowColor: Colors.deepPurpleAccent,
        //   elevation: 5,
        //   child: Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: Stack(
        //       children: [
        //         ListTile(
        //           onTap: () {
        //             Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                 builder: (context) => DetailPage(seminarData),
        //               ),
        //             );
        //           },
        //           leading: Image.asset(
        //             seminarData.image,
        //           ),
        //           title: Text(
        //             seminarData.name,
        //           ),
        //           subtitle: Text(seminarData.capacity.toString()),
        //         ),
        //         Positioned(
        //           bottom: 1,
        //           right: 0,
        //           child: RaisedButton(
        //               shape: RoundedRectangleBorder(
        //                 borderRadius: BorderRadius.circular(10.0),
        //               ),
        //               child: Text(
        //                 seminarData.status,
        //                 style: TextStyle(
        //                   color:
        //                       seminarData.isBooked ? Colors.red : Colors.green,
        //                   fontSize: 15,
        //                 ),
        //               ),
        //               color: Colors.deepPurpleAccent,
        //               onPressed: () {
        //                 Navigator.push(
        //                   context,
        //                   MaterialPageRoute(
        //                     builder: (context) => DetailPage(seminarData),
        //                   ),
        //                 );
        //               }),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
