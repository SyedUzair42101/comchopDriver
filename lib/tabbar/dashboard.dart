import 'dart:async';

import 'package:delivery_boy_application/details/available_deliveries.dart';
import 'package:delivery_boy_application/http_services/htt_services.dart';
import 'package:delivery_boy_application/http_services/location_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class dashboard extends StatefulWidget {
  dashboard({Key? key}) : super(key: key);

  @override
  _dashboardState createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {

  bool isSwitched = false;
  var textValue = 'You are offline';
   int? status ;
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(45.521563, -122.677433);

  final Set<Marker> _markers = {};

  void toggleSwitch(bool value,) {

    if (isSwitched == false) {

      setState(() {
        isSwitched = true;
        textValue = 'You are online';
        status = 1;
        http_service().driverworkstatus(status);
      });
      print('You are online');
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'You are offline';
        status = 0;
        http_service().driverworkstatus(status);
      });
      print('You are offline');
    }
  }


@override
  void initState() {
  location_data().currentlocation();


  // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
          zoomControlsEnabled: false,
          zoomGesturesEnabled: false,
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
                      '$textValue',
                      style: TextStyle(fontSize: 15),
                    ),
                    Switch(

                      onChanged: toggleSwitch,
                      value: isSwitched,
                      activeColor: Colors.white,
                      activeTrackColor: Colors.orange,
                      inactiveThumbColor: Colors.grey,
                      inactiveTrackColor: Colors.orange,
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
                        // location_data().currentlocation();

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
