import 'package:delivery_boy_application/cards_screen/id_card_screen.dart';
import 'package:flutter/material.dart';

class welcome_listtile_screen extends StatelessWidget {
  final firstname;
  final lastname;
  final emailaddress;
  final phonenumber;
  final password;
  final cityid;
  final confirmpassword;

  const welcome_listtile_screen(
      {Key? key,
      this.firstname,
      this.lastname,
      this.emailaddress,
      this.phonenumber,
      this.password,
      this.cityid,
      this.confirmpassword})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 10,
          bottom: 10,
        ),
        child: Column(
          children: [
            Center(
                child: Text(
              'Welcome, John Doe',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 30),
            )),
            Text(
              'Here’s what you need to do to set up \nyour account.',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color.fromRGBO(159, 159, 159, 1)),
            ),
            ListTile(
              onTap: () {
                // print(firstname +
                //     lastname +
                //     emailaddress +
                //     phonenumber +
                //     password +
                //     cityid +
                //     confirmpassword);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => id_card_screen(
                            firstname: firstname,
                            lastname: lastname,
                            emailaddress: emailaddress,
                            phonenumber: phonenumber,
                            password: password,
                            cityid: cityid,
                            confirmpassword: confirmpassword,
                          )),
                );
              },
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.black,
              ),
              title: Text('Terms and Conditions',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400)),
              subtitle: Text(
                'Recommended next step',
                style: TextStyle(color: Colors.blue),
              ),
              leading: Image.asset(
                'images/paypal.png',
                height: 45,
                width: 45,
              ),
            ),
            Divider(),
            ListTile(
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.black,
              ),
              title: Text('Social Security Card front side',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400)),
              subtitle: Text(
                'Get Started',
                style: TextStyle(color: Colors.blue),
              ),
              leading: Image.asset(
                'images/paypal.png',
                height: 45,
                width: 45,
              ),
            ),
            Divider(),
            ListTile(
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.black,
              ),
              title: Text('Social Security Card Back side',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400)),
              subtitle: Text(
                'Get Started',
                style: TextStyle(color: Colors.blue),
              ),
              leading: Image.asset(
                'images/paypal.png',
                height: 45,
                width: 45,
              ),
            ),
            Divider(),
            ListTile(
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.black,
              ),
              title: Text('Driving License Front Side',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400)),
              subtitle: Text(
                'Get Started',
                style: TextStyle(color: Colors.blue),
              ),
              leading: Image.asset(
                'images/paypal.png',
                height: 45,
                width: 45,
              ),
            ),
            Divider(),
            ListTile(
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.black,
              ),
              title: Text('Driving License Back Side',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400)),
              subtitle: Text(
                'Get Started',
                style: TextStyle(color: Colors.blue),
              ),
              leading: Image.asset(
                'images/paypal.png',
                height: 45,
                width: 45,
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
