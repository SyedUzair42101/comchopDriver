import 'dart:async';

import 'package:delivery_boy_application/details/available_deliveries.dart';
import 'package:delivery_boy_application/http_services/htt_services.dart';
import 'package:delivery_boy_application/http_services/location_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
class dashboard extends StatefulWidget {
  dashboard({Key? key}) : super(key: key);

  @override
  _dashboardState createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  bool isSwitchedFT = false;
  LatLng startLocation = LatLng(33.720001,73.059998);
  GoogleMapController? mapController; //contrller for Google map
  late Position position;
  bool isSwitched = false;
  var textValue = 'You are offline';
  int? status;
  // final Set<Marker> _markers = {};
  // void toggleSwitch(
  //   bool value,
  // ) {
  //   isSwitchedFT = value;
  //
  //   print('Saved state is $isSwitchedFT');
  //   if (isSwitchedFT == false) {
  //     setState(() {
  //       isSwitchedFT = true;
  //       textValue = 'You are online';
  //       status = 1;
  //       http_service().driverworkstatus(status);
  //     });
  //     print('You are online');
  //   } else {
  //     setState(() {
  //       isSwitchedFT = false;
  //       textValue = 'You are offline';
  //       status = 0;
  //       http_service().driverworkstatus(status);
  //     });
  //     print('You are offline');
  //   }
  // }
  final switchData = GetStorage();

getswitchval()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.getBool("switchState" );

  if( prefs.getBool("switchState" )  != null)
  {
    setState(() {
      isSwitched = prefs.getBool("switchState" )!;
    });
  }
}

  @override
  void initState() {




      super.initState();
      if(switchData.read('isSwitched') != null)
      {
        setState(() {
          isSwitched = switchData.read('isSwitched');
        });
      }
    }

  var valuesatus ;
  bool switchControl = false;
  bool switchControl2 = false;
  bool switchControl3 = false;
  var textHolder = ' ';
  var textHolder2 = " ";
  var textHolder3 ="OFF";
  Future<void> toggleSwitch(bool value) async {

    if(isSwitched == false )
    {
      setState(() {
        saveSwitchState(value);
        switchControl = true;
        textHolder = 'online';
        status = 1;
        http_service().driverworkstatus(status);
      });
      print('ON');
      setState(() {
        isSwitched = value;
        switchData.write('isSwitched', isSwitched);
      });
    }
    else
    {
      setState(() {
         isSwitched = false;
        switchData.write('isSwitched', isSwitched);
        textHolder = 'offine';
        status = 0;
        http_service().driverworkstatus(status);
      });
      print('OFF');
    }
  }
  getSwitchValues() async {
    switchControl = await getSwitchState();
    setState(() {});


  }


  Future<bool> saveSwitchState(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("switchState", value);
    print('Switch Value saved $value');
    setState(() {
      valuesatus = prefs.getBool("switchState", );
    });
    return prefs.setBool("switchState", value);
  }





  Future<bool> getSwitchState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isSwitchedFT = prefs.getBool("switchState") ?? false;
    print(isSwitchedFT);

    return isSwitchedFT;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            GoogleMap(
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              //Map widget from google_maps_flutter package
              zoomGesturesEnabled: true, //enable Zoom in, out on map
              initialCameraPosition: CameraPosition( //innital position in map
                target: startLocation, //initial position
                zoom: 14.0, //initial zoom level
              ),

              mapType: MapType.normal,
              onMapCreated: (controller) {
                setState(() {
                  mapController = controller;
                });
              },
            ),
    SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 28.0,
                  left: 8.0,
                  right: 8.0,
                ),
                child: Container(
                    padding: EdgeInsets.all(10),
                    height: 50.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '$textHolder',
                          style: TextStyle(fontSize: 15),
                        ),
                        Switch(
                          onChanged: toggleSwitch,
                          value: isSwitched,
                          activeColor: Colors.pinkAccent,
                          activeTrackColor: Colors.grey[400],
                          inactiveThumbColor: Colors.grey[200],
                          inactiveTrackColor: Colors.grey,
                        ),
                      ],
                    )),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  onPressed: () {},
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        ' You’re Online Available Delivery',
                        style: TextStyle(fontSize: 15),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      avilable_delievries()),
                            );
                          },
                          icon: Icon(Icons.arrow_forward_outlined))
                    ],
                  ),
                  color: Colors.white,
                  textColor: Colors.black,
                  elevation: 5,
                ),
              ),
            ),
          ],
        ));

  }
}