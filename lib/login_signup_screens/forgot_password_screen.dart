import 'package:delivery_boy_application/login_signup_screens/otp_screen.dart';
import 'package:delivery_boy_application/login_signup_screens/reset_email_send.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class forgot_password_screen extends StatelessWidget {
  final TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        appBar: AppBar(
          title: Text('Sign In'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
          elevation: 0.0,
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Forgot Password ',
                  style: TextStyle(color: Colors.black, fontSize: 34),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Enter your email address and we will ',
                  style: TextStyle(
                      color: Color.fromRGBO(134, 134, 134, 1), fontSize: 16),
                ),
                SizedBox(
                  height: 5,
                ),
                RichText(
                    text: TextSpan(children: <TextSpan>[
                  TextSpan(
                    text: "send you a reset instructions.",
                    style: TextStyle(
                        color: Color.fromRGBO(134, 134, 134, 1), fontSize: 16),
                  ),
                ])),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 334,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextField(
                      controller: _email,
                      decoration: InputDecoration(
                          suffixStyle: TextStyle(color: Colors.grey),
                          suffixIcon: Icon(
                            Icons.check,
                            color: Color.fromRGBO(252, 186, 24, 1),
                          ),
                          prefixStyle: TextStyle(color: Colors.grey),
                          hintText: 'Email Address',
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey,
                              )),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.red)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.red))),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: Container(
                      height: 50,
                      width: 290,
                      child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: Color.fromRGBO(252, 186, 24, 1),
                          child: Text(
                            'Reset password',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            emailver(context);
                          })),
                ),
              ]),
        ));
  }

  void emailver(BuildContext context) async {
    final multipartRequest = new http.MultipartRequest(
        "POST",
        Uri.parse(
            "https://dnpprojects.com/demo/comshop/api/driverforgetPassword"));

    multipartRequest.fields.addAll({
      "email_address": _email.text,
    });
    http.StreamedResponse response = await multipartRequest.send();

    var responseString = await response.stream.bytesToString();

    if (response.statusCode == 200) {}
    if (responseString ==
        '{"success":"We have e-mailed your password reset Code!"}') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (BuildContext context) => otp_screen()),
      );
      // showDialog(
      //   context: context,
      //   builder: (BuildContext context) {
      //     return AlertDialog(
      //       title: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           Container(
      //             height: 80,
      //             width: 80,
      //             child: Image.asset(
      //               'images/crs.png',
      //               height: 80,
      //               width: 80,
      //             ),
      //           ),
      //           SizedBox(
      //             height: 10,
      //           ),
      //           Text(
      //             "Email Address has Already Registered",
      //             textAlign: TextAlign.center,
      //             style: TextStyle(fontSize: 16),
      //           ),
      //         ],
      //       ),
      //       actions: <Widget>[
      //         FlatButton(
      //           child: new Text("OK"),
      //           onPressed: () {
      //               Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                     builder: (BuildContext context) =>
      //                         create_acount_screen()),
      // );
      //           },
      //         ),
      //       ],
      //     );
      //   },
      // );
    } else {
      // showDialog(
      //   context: context,
      //   builder: (BuildContext context) {
      //     return AlertDialog(
      //       title: Column(
      //         children: [
      //           Container(
      //             height: 80,
      //             width: 80,
      //             child: Image.asset(
      //               'images/chk.png',
      //               height: 80,
      //               width: 80,
      //             ),
      //           ),
      //           SizedBox(
      //             height: 10,
      //           ),
      //           new Text(
      //             "User Register Sucessfully",
      //             textAlign: TextAlign.center,
      //             style: TextStyle(fontSize: 16),
      //           ),
      //         ],
      //       ),
      //       actions: <Widget>[
      //         FlatButton(
      //           child: new Text("OK"),
      //           onPressed: () {
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (BuildContext context) => login_screen()),
      //             );
      //           },
      //         ),
      //       ],
      //     );
      //   },
      // );
    }

    print("response: " + responseString);
    print("response Status: ${response.statusCode}");
  }
}
