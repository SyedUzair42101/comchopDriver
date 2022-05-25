import 'package:delivery_boy_application/http_services/htt_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class change_password extends StatefulWidget {
  const change_password({Key? key}) : super(key: key);

  @override
  _change_passwordState createState() => _change_passwordState();
}

class _change_passwordState extends State<change_password> {
  final TextEditingController _password = TextEditingController();
  final TextEditingController _newpassword = TextEditingController();
  final TextEditingController _confirmpassword = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool _isObscure = true;
  bool _issObscure = true;
  bool _isssObscure = true;
  @override
  Widget build(BuildContext context) {
    var http_services = Provider.of<http_service>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
        title: Text('Profile Settings',
            style: TextStyle(color: Colors.black, fontSize: 22)),
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              TextFormField(
                obscureText: _isObscure,
                validator: (var value) {
                  if (value!.isEmpty) {
                    return "please enter pasword";
                  } else if (value.length < 7) {
                    return "Must be more than 7 charater";
                  }
                  return null;
                },
                controller: _password,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        color: Colors.grey,
                        icon: Icon(_isObscure
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        }),
                    prefixStyle: TextStyle(color: Colors.grey),
                    hintText: 'Password',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(242, 242, 242, 1),
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.black.withAlpha(15),
                        )),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.red)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.red))),
              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                obscureText: _issObscure,
                validator: (var value) {
                  if (value!.isEmpty) {
                    return "please enter pasword";
                  } else if (value.length < 7) {
                    return "Must be more than 7 charater";
                  }
                  return null;
                },
                controller: _newpassword,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        color: Colors.grey,
                        icon: Icon(_issObscure
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _issObscure = !_issObscure;
                          });
                        }),
                    prefixStyle: TextStyle(color: Colors.grey),
                    hintText: 'New Password',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(242, 242, 242, 1),
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.black.withAlpha(15),
                        )),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.red)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.red))),
              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                obscureText: _isssObscure,
                validator: (var value) {
                  if (value!.isEmpty) {
                    return "please enter pasword";
                  } else if (value.length < 7) {
                    return "Must be more than 7 charater";
                  }
                  return null;
                },
                controller: _confirmpassword,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        color: Colors.grey,
                        icon: Icon(_isssObscure
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isssObscure = !_isssObscure;
                          });
                        }),
                    prefixStyle: TextStyle(color: Colors.grey),
                    hintText: 'New Password',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(242, 242, 242, 1),
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.black.withAlpha(15),
                        )),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.red)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.red))),
              ),
              SizedBox(
                height: 200,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: Container(
                        height: 50,
                        width: 290,
                        child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: Color.fromRGBO(252, 186, 24, 1),
                            child: Text(
                              'Change settings',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              http_services.changePassword(
                                  _password.text,
                                  _newpassword.text,
                                  _confirmpassword.text,
                                  context);
                            })),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
