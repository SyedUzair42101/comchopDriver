import 'dart:convert';
import 'dart:io';
import 'package:delivery_boy_application/login_signup_screens/login_screen.dart';
import 'package:delivery_boy_application/login_signup_screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class driving_license_backside extends StatefulWidget {
  final firstname;
  final lastname;
  final emailaddress;
  final phonenumber;
  final password;
  final cityid;
  final confirmpassword;
  final Frontimage;
  final Backimage;
  final FrontDimage;
  const driving_license_backside(
      {Key? key,
      this.firstname,
      this.lastname,
      this.emailaddress,
      this.phonenumber,
      this.password,
      this.cityid,
      this.confirmpassword,
      this.Frontimage,
      this.Backimage,
      this.FrontDimage})
      : super(key: key);
  @override
  _driving_license_backsideState createState() =>
      _driving_license_backsideState();
}

class _driving_license_backsideState extends State<driving_license_backside> {
  bool visible = false;
  File? drivingBack;
  void _getFromCamera() async {
    XFile? pickedimage = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 50);

    setState(() {
      drivingBack = File(pickedimage!.path);

      print(drivingBack);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        elevation: 0.0,
        leading: Icon(
          Icons.arrow_back_ios_rounded,
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            top: 5,
            bottom: 10,
            left: 15,
            right: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: Text(
                'Take a photo of your Driving License',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 30),
              )),
              SizedBox(
                height: 10,
              ),
              Center(
                  child: Text(
                'Take Picture of Whole card (include all corners).\nMake sure that Picture is clear and all words are easily readable. If any of the information is blurry or too shiny (from camera flash ), card will be rejected. ',
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
              )),
              SizedBox(
                height: 15,
              ),
              Container(
                  height: 220,
                  width: 310,
                  child: drivingBack == null
                      ? InkWell(
                          onTap: () {
                            _getFromCamera();
                          },
                          child: Image.asset(
                            'images/idcardback.png',
                            fit: BoxFit.fill,
                            height: 220,
                            width: 310,
                          ),
                        )
                      : Image.file(
                          drivingBack!,
                          fit: BoxFit.fill,
                          height: 220,
                          width: 310,
                        )),
              SizedBox(
                height: 215,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    uploadImage();

                    // print(widget.Frontimage.toString() +
                    //     widget.Backimage.toString() +
                    //     widget.FrontDimage.toString() +
                    //     drivingBack.toString() +
                    //     widget.firstname +
                    //     widget.lastname +
                    //     widget.emailaddress +
                    //     widget.phonenumber +
                    //     widget.password +
                    //     widget.cityid +
                    //     widget.confirmpassword);
                  },
                  child: Container(
                      height: 48,
                      width: 335,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(252, 186, 24, 1),
                          borderRadius: BorderRadius.circular(6)),
                      child: Center(
                        child: Text(
                          'Continue',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Colors.white,
                          ),
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future uploadImage() async {
    final multipartRequest = new http.MultipartRequest("POST",
        Uri.parse("https://dnpprojects.com/demo/comshop/api/DriverRegister"));

    multipartRequest.fields.addAll({
      "first_name": widget.firstname,
      "last_name": widget.lastname,
      "email_address": widget.emailaddress,
      "phone_number": widget.phonenumber,
      "password": widget.password,
      "city_id": widget.cityid,
      "confirm_password": widget.password,
    });
    multipartRequest.files.add(
      await http.MultipartFile.fromPath(
        'card_front',
        widget.Frontimage!.path,
      ),
    );
    multipartRequest.files.add(
      await http.MultipartFile.fromPath(
        'card_back',
        widget.Backimage!.path,
      ),
    );
    multipartRequest.files.add(
      await http.MultipartFile.fromPath(
        'license_front',
        widget.FrontDimage!.path,
      ),
    );
    multipartRequest.files.add(
      await http.MultipartFile.fromPath(
        'license_back',
        drivingBack!.path,
      ),
    );
    http.StreamedResponse response = await multipartRequest.send();

    var responseString = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      setState(() {
        visible = false;
      });
    }
    if (responseString ==
        '{"success":false,"error":{"email_address":["The email address has already been taken."]}}') {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 80,
                  width: 80,
                  child: Image.asset(
                    'images/crs.png',
                    height: 80,
                    width: 80,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Email Address has Already Registered",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => signup_screen()),
                  );
                },
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Column(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  child: Image.asset(
                    'images/chk.png',
                    height: 80,
                    width: 80,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                new Text(
                  "User Register Sucessfully",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => login_screen()),
                  );
                },
              ),
            ],
          );
        },
      );
    }

    print("response: " + responseString);
    print("response Status: ${response.statusCode}");
  }
}

showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("ERROR"),
    content: Text("User Already Exist"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showDoneDialog(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("My title"),
    content: Text("This is my message."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
