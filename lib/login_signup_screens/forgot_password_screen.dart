import 'package:delivery_boy_application/login_signup_screens/reset_email_send.dart';
import 'package:flutter/material.dart';






class forgot_password_screen extends StatelessWidget {
  const forgot_password_screen({Key? key}) : super(key: key);

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
                Text('Enter your email address and we will ', style: TextStyle(color: Color.fromRGBO(134, 134, 134, 1), fontSize: 16),),
                SizedBox(
                  height: 5,
                ),
                RichText(
                    text: TextSpan(children: <TextSpan>[
                  TextSpan(
                    text: "send you a reset instructions.",
                    style: TextStyle(color: Color.fromRGBO(134, 134, 134, 1), fontSize: 16),
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
                      keyboardType: TextInputType.phone,
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      reset_email_screen()),

                            );
                          })),
                ),
              ]),
        ));
  }
}
 