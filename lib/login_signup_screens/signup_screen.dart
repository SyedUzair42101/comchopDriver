import 'dart:convert';

import 'package:delivery_boy_application/main.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'welcome_listile_screen.dart';

class signup_screen extends StatefulWidget {
  const signup_screen({Key? key}) : super(key: key);

  @override
  _signup_screenState createState() => _signup_screenState();
}

class _signup_screenState extends State<signup_screen> {
  bool agree = false;
  final TextEditingController _fname = TextEditingController();
  final TextEditingController _lname = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Container(
            padding: EdgeInsets.only(
              left: 15,
              right: 15,
              top: 20,
              bottom: 10,
            ),
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                      child: Text(
                    'Let’s start with \ncreating your account',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 30),
                  )),
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(242, 242, 242, 1),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              width: 150,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 0),
                                child: TextFormField(
                                  controller: _fname,
                                  decoration: InputDecoration(
                                      labelText: 'First Name',
                                      labelStyle: TextStyle(
                                          fontFamily: 'Roboto',
                                          color: Colors.black),
                                      alignLabelWithHint: true,
                                      hintStyle: TextStyle(
                                        fontFamily: 'Roboto',
                                      ),
                                      prefixStyle:
                                          TextStyle(color: Colors.grey),
                                      hintText: 'First Name',
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.grey,
                                          )),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.grey,
                                          )),
                                      errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.red)),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.red))),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(242, 242, 242, 1),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              width: 150,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 0),
                                child: TextFormField(
                                  controller: _lname,
                                  decoration: InputDecoration(
                                      labelText: 'Last Name',
                                      labelStyle: TextStyle(
                                          fontFamily: 'Roboto',
                                          color: Colors.black),
                                      alignLabelWithHint: true,
                                      hintStyle: TextStyle(
                                        fontFamily: 'Roboto',
                                      ),
                                      prefixStyle:
                                          TextStyle(color: Colors.grey),
                                      hintText: 'Last Name  ',
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.grey,
                                          )),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: Colors.grey,
                                          )),
                                      errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.red)),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.red))),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(242, 242, 242, 1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: TextFormField(
                          controller: _email,
                          decoration: InputDecoration(
                              labelText: 'Email Address',
                              labelStyle: TextStyle(
                                  fontFamily: 'Roboto', color: Colors.black),
                              alignLabelWithHint: true,
                              hintStyle: TextStyle(
                                fontFamily: 'Roboto',
                              ),
                              prefixStyle: TextStyle(color: Colors.grey),
                              hintText: 'Email Address',
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  )),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  )),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(color: Colors.red)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(color: Colors.red))),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(242, 242, 242, 1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: TextFormField(
                          controller: _phone,
                          decoration: InputDecoration(
                              labelText: 'Phone Number',
                              labelStyle: TextStyle(
                                  fontFamily: 'Roboto', color: Colors.black),
                              alignLabelWithHint: true,
                              hintStyle: TextStyle(
                                fontFamily: 'Roboto',
                              ),
                              prefixStyle: TextStyle(color: Colors.grey),
                              hintText: 'Phone Number',
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  )),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  )),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(color: Colors.red)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(color: Colors.red))),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(242, 242, 242, 1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: TextFormField(
                          controller: _password,
                          decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                  fontFamily: 'Roboto', color: Colors.black),
                              alignLabelWithHint: true,
                              hintStyle: TextStyle(
                                fontFamily: 'Roboto',
                              ),
                              prefixStyle: TextStyle(color: Colors.grey),
                              hintText: 'Password',
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  )),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  )),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(color: Colors.red)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(color: Colors.red))),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(242, 242, 242, 1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: TextFormField(
                          controller: _city,
                          decoration: InputDecoration(
                              labelText: 'City',
                              labelStyle: TextStyle(
                                  fontFamily: 'Roboto', color: Colors.black),
                              alignLabelWithHint: true,
                              hintStyle: TextStyle(
                                fontFamily: 'Roboto',
                              ),
                              prefixStyle: TextStyle(color: Colors.grey),
                              hintText: 'City',
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  )),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  )),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(color: Colors.red)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(color: Colors.red))),
                        ),
                      ),
                    ),
                  ),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                            focusColor: Color.fromRGBO(252, 186, 24, 1),
                            hoverColor: Color.fromRGBO(252, 186, 24, 1),
                            checkColor: Color.fromRGBO(252, 186, 24, 1),
                            activeColor: Colors.white,
                            value: agree,
                            onChanged: (value) {
                              setState(() {
                                agree = value ?? false;
                              });
                            }),
                        RichText(
                            text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: "By proceeding I agree to cupshop ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                          TextSpan(
                            text: "\nuser Aggrement ",
                            style: TextStyle(
                                color: Color.fromRGBO(252, 186, 24, 1),
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyHomePage()),
                                );
                              },
                          ),
                          TextSpan(
                              text: "and",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400)),
                          TextSpan(
                            text: " Privacy policy ",
                            style: TextStyle(
                                color: Color.fromRGBO(252, 186, 24, 1),
                                fontSize: 14),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyHomePage()),
                                );
                              },
                          ),
                        ])),
                      ]),
                  Container(
                      height: 48,
                      width: 335,
                      child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                          color: Color.fromRGBO(252, 186, 24, 1),
                          child: Text(
                            'continiue',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              print("Sucessful");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        welcome_listtile_screen(
                                          firstname: _fname.text,
                                          lastname: _lname.text,
                                          emailaddress: _email.text,
                                          phonenumber: _phone.text,
                                          password: _password.text,
                                          cityid: _city.text,
                                          confirmpassword: _password.text,
                                        )),
                              );
                            } else {
                              print("Unsucessful");
                            }
                            // print(_fname.text +
                            //     _lname.text +
                            //     _email.text +
                            //     _phone.text +
                            //     _password.text +
                            //     _city.text +
                            //     _password.text);
                          })),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
