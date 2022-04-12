import 'dart:convert';
import 'dart:io';

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
                    asyncFileUpload();
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

  Future asyncFileUpload() async {
    var APIURL =
        Uri.parse("https://dnpprojects.com/demo/comshop/api/DriverRegister");
    //create multipart request for POST or PATCH method
    var request = http.MultipartRequest("POST", APIURL);
    //add text fields
    request.fields["first_name"] = widget.firstname;
    request.fields["last_name"] = widget.lastname;
    request.fields["email_address"] = "dnbhhhgggzzgddbb";
    request.fields["phone_number"] = widget.phonenumber;
    request.fields["password"] = "widget.password";
    request.fields["city_id"] = widget.cityid;
    request.fields["confirm_password"] = "widget.password";
    http.MultipartFile multipartFile =
        await http.MultipartFile.fromPath('card_front', widget.Frontimage);
    http.MultipartFile multipartFile1 =
        await http.MultipartFile.fromPath('card_back', widget.Backimage);
    http.MultipartFile multipartFile2 =
        await http.MultipartFile.fromPath('license_front', widget.FrontDimage);
    http.MultipartFile multipartFile3 = await http.MultipartFile.fromPath(
        'license_back', drivingBack.toString());
    // var pic = http.MultipartFile.fromBytes("card_front", widget.Frontimage);

    //add multipart to request
    //request.files.add(pic);
    request.files.add(multipartFile);
    request.files.add(multipartFile1);
    request.files.add(multipartFile2);
    request.files.add(multipartFile3);

    var response = await request.send();
    print(response);
    //Get the response from the server
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    print(response.statusCode);
    print(responseString);
  }

  Future RegistrationUser() async {
    List<int> fileContent = widget.Frontimage.readAsBytesSync();

    String fileContentBase64 = base64.encode(fileContent);
    print(fileContentBase64);
    // var fileContent = widget.Frontimage.readAsBytesSync();
    // var fileContentBase64 = base64.encode(fileContent);
    List<int> fileContent1 = widget.Backimage.readAsBytesSync();
    String fileContentBase641 = base64.encode(fileContent);
    List<int> fileContent2 = widget.FrontDimage.readAsBytesSync();
    String fileContentBase642 = base64.encode(fileContent);
    var APIURL =
        Uri.parse("https://dnpprojects.com/demo/comshop/api/DriverRegister");
    var mapdata = {
      'first_name': widget.firstname,
      'last_name': widget.lastname,
      'email_address': "hvbcgd",
      'phone_number': widget.phonenumber,
      'password': widget.password,
      'city_id': widget.cityid,
      'confirm_password': widget.confirmpassword,
      "card_front": fileContentBase641.toString(),
      "card_back": fileContentBase641.toString(),
      "license_front": fileContentBase642.toString(),
      "license_back": fileContentBase642.toString(),
    };

    //print("JSON DATA: ${mapdata}");
    http.Response response = await http.post(APIURL, body: mapdata);
    var data = jsonDecode(response.body);
    print("DATA: ${data}");
  }
}
