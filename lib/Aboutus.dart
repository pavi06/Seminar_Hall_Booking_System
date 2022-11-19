import 'package:flutter/material.dart';
import 'package:seminar_hall_booking/menupage.dart';

class AboutUsPage extends StatelessWidget {

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
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10,20,10,20),
                child: Column(
                  children: [
                    Text('About Us '.toUpperCase(),
                      style: TextStyle(
                        fontFamily: 'Alegreya',
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                      ),),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 1,
                      width: 300,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                        child:
                          Image.asset('images/abcdlogo1.jpg',
                          width: 120,
                            height: 120,
                          ),
                   ),
                    Container(
                       child: Text('   ABCD Engineering College',
                            style: TextStyle(
                              fontFamily: 'Lobster',
                              fontSize: 20,
                            ),
                          ),
                    ),
                    Container(
                      child: Text('\n         The college contains 6 seminar halls.The user can book the seminar halls using this app. For further queries contact us on '
                          '\n      1234567890'
                          '\n      abcd@gmail.com',
                        style: TextStyle(
                          fontFamily: 'Lobster',
                          fontSize: 20,
                        ),
                        maxLines: 10,),
                    )
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
