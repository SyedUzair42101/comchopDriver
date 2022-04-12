import 'dart:io';

import 'package:delivery_boy_application/cards_screen/driving_license_front.dart';
import 'package:delivery_boy_application/login_signup_screens/welcome_listile_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class id_card_backside extends StatefulWidget {
  final firstname;
  final lastname;
  final emailaddress;
  final phonenumber;
  final password;
  final cityid;
  final confirmpassword;
  final Frontimage;
  const id_card_backside(
      {Key? key,
      this.firstname,
      this.lastname,
      this.emailaddress,
      this.phonenumber,
      this.password,
      this.cityid,
      this.confirmpassword,
      this.Frontimage})
      : super(key: key);

  @override
  State<id_card_backside> createState() => _id_card_backsideState();
}

class _id_card_backsideState extends State<id_card_backside> {
  File? imageBack;
  void _getFromCamera() async {
    XFile? pickedimage = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 50);

    setState(() {
      imageBack = File(pickedimage!.path);
      print(imageBack);
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
                'Take a photo of your Social Security Card',
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
                  child: imageBack == null
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
                          imageBack!,
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
                    // print(widget.Frontimage.toString() +
                    //     imageBack.toString() +
                    //     widget.firstname +
                    //     widget.lastname +
                    //     widget.emailaddress +
                    //     widget.phonenumber +
                    //     widget.password +
                    //     widget.cityid +
                    //     widget.confirmpassword);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              driving_license_front(
                                Frontimage: widget.Frontimage,
                                Backimage: imageBack,
                                firstname: widget.firstname,
                                lastname: widget.lastname,
                                emailaddress: widget.emailaddress,
                                phonenumber: widget.phonenumber,
                                password: widget.password,
                                cityid: widget.cityid,
                                confirmpassword: widget.confirmpassword,
                              )),
                    );
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
}
