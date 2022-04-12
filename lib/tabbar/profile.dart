import 'package:delivery_boy_application/details/alertbox.dart';
import 'package:delivery_boy_application/login_signup_screens/login_screen.dart';
import 'package:delivery_boy_application/settings_screen/notifications.dart';
import 'package:delivery_boy_application/settings_screen/profile_screens.dart';
import 'package:flutter/material.dart';

class profile extends StatelessWidget {
  const profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'History',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
      ),
      body:
      Container(
        padding: EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: Column(children: [
          Center(
              child: Text(
            'profile',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 27),
          )),
          Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(10),
            height: 120,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      child: Center(child: Image.asset('images/person.png')),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Cameron Williamson',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'sumanyak@gmail.com',
                          style: TextStyle(
                              color: Color.fromRGBO(136, 136, 136, 1)),
                        ),
                        Text(
                          '+91 xxxxxxxxxxx',
                          style: TextStyle(
                              color: Color.fromRGBO(136, 136, 136, 1)),
                        ),
                        Text(
                          '#21-22-31, Masab Tank',
                          style: TextStyle(
                              color: Color.fromRGBO(136, 136, 136, 1)),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => notifications()),
              );
            },
            child: Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(10),
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: new BoxDecoration(
                  color: Color.fromRGBO(244, 244, 244, 1),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.notifications,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Notification',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.chevron_right_sharp,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => profile_screen()),
              );
            },
            child: Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(10),
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: new BoxDecoration(
                  color: Color.fromRGBO(244, 244, 244, 1),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.settings,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Setting',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.chevron_right_sharp,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              modal().showAlertDialog(context);

            },
            child: Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(10),
              height: 50,
              width: 190,
              decoration: new BoxDecoration(
                  color: Color.fromRGBO(252, 186, 24, 1),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Log Out',
                      style: TextStyle(
                          fontWeight: FontWeight.w700, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
