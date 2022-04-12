import 'package:delivery_boy_application/login_signup_screens/login_screen.dart';
import 'package:delivery_boy_application/login_signup_screens/signup_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class reset_email_screen extends StatelessWidget {
  const reset_email_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Text( 'Reset email sent', style: TextStyle(color: Colors.black, fontSize: 34),),
                SizedBox(height: 10,),
                Text( 'We have sent a instructions email to ', style: TextStyle(color: Color.fromRGBO(134, 134, 134, 1), fontSize: 16),),
                SizedBox(height: 5,),
                RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                        text: " Nawfazim@icloud.com. ",


                        style: TextStyle(color: Color.fromRGBO(134, 134, 134, 1), fontSize: 16),
                      ),
                      TextSpan(
                        text: " Having problem? ",
                        style: TextStyle(
                          color: Color.fromRGBO(252, 186, 24, 1),
                          fontSize: 16,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => login_screen()),
                            );
                          },
                      ),
                    ])),
                SizedBox(height: 30,),
                Center(
                  child: Container(
                      height: 50,
                      width: 290,
                      child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: Color.fromRGBO(252, 186, 24, 1),
                          child: Text(
                            'Send Again',
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
                                      signup_screen()),

                            );
                          }



                      )
                  ),
                ),
              ]),
        ));
  }
}
