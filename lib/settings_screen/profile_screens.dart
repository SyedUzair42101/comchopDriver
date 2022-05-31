import 'package:delivery_boy_application/http_services/htt_services.dart';
import 'package:delivery_boy_application/models/profileDetails.dart';
import 'package:delivery_boy_application/widgets/dashboard_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class profile_screen extends StatelessWidget {
  const profile_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<http_service>(context);
    TextEditingController _nameController = TextEditingController();
    TextEditingController _email = TextEditingController();
    TextEditingController _password = TextEditingController();
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        // Text( 'profile',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 27),)),
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
      body: SingleChildScrollView(
        child: FutureBuilder<driverProfile?>(
            future: provider.driverprofile(),
            builder: (c, snapshot) {
              var a = snapshot.data!.data![0].firstName ?? _nameController.text;
              var b = snapshot.data!.data![0].lastName ?? _nameController.text;

              if (snapshot.connectionState == ConnectionState.waiting)
                return Center(child: dashboardwidget().cicularbar());
              if (snapshot.hasData)
                return Align(
                    alignment: Alignment.center,
                    child: dashboardwidget().cicularbar());
              _nameController.text = a + " " + b;

              _email.text =
                  snapshot.data!.data![0].emailAddress ?? _nameController.text;
              _password.text =
                  snapshot.data!.data![0].phoneNumber ?? _nameController.text;

              if (snapshot.hasData)
                return Container(
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      TextField(
                        readOnly: true,
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: 'Full name',
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextField(
                        readOnly: true,
                        controller: _email,
                        decoration: InputDecoration(
                          labelText: 'Email address',
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextField(
                        readOnly: true,
                        controller: _password,
                        style: TextStyle(color: Colors.grey),
                        decoration: InputDecoration(
                          labelText: 'Phone number',
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              if (snapshot.hasError) print(snapshot.error.toString());
              return Align(
                  alignment: Alignment.center,
                  child: dashboardwidget().cicularbar());
            }),
      ),
    );
  }
}
