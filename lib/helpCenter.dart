import 'package:seminar_hall_booking/menupage.dart';
import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
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
               child:Column(
                 children: [
                   SizedBox(
                     height: 10,
                   ),
                   Text('Help Center'.toUpperCase(),
                     style: TextStyle(
                       fontFamily: 'Alegreya',
                       fontSize: 35,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                   SizedBox(
                     height: 10,
                   ),
                   Container(
                     height: 1,
                     width: 300,
                     color: Colors.grey,
                   ),
                   Padding(
                     padding: const EdgeInsets.fromLTRB(10,20,10,20),
                     child: Text('       The available seminar halls will contain book now option. User can send the book request when required and the request will be sent to the admin.The approval will be given by the higher official. You will be notified about your booking status.'
                         '\n   For further details contact us on \n'
                         '       1234567890\n'
                         '       abcd@gmail.com',
                       style: TextStyle(
                         fontFamily: 'Lobster',
                         fontSize: 20,
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
