import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class uservendoes_location extends StatefulWidget {
  const uservendoes_location({Key? key}) : super(key: key);



  @override
  State<uservendoes_location> createState() => _uservendoes_locationState();
}

class _uservendoes_locationState extends State<uservendoes_location> {
  Set<Marker> _markers = <Marker>{};

  // declare a global key
  final GlobalKey globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Stack(
            children: [

              // you have to add your widget in the same widget tree
              // add your google map in stack
              // declare your marker before google map
              // pass your global key to your widget

              MyMarker(globalKey),

              Positioned.fill(
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                      target: LatLng(32.4279, 53.6880), zoom: 15),
                  markers: _markers,
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
            label: FittedBox(child: Text('Add Markers')),
            onPressed: () async {

              // call widgetToIcon Function and pass the same global key

              _markers.add(
                Marker(
                  markerId: MarkerId('circleCanvasWithText'),
                  icon: await MarkerIcon.widgetToIcon(globalKey),
                  position: LatLng(35.8400, 50.9391),
                ),
              );
              setState(() {});
            },
          ),
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerFloat,
        ),
      ],
    );
  }
}

class MyMarker extends StatelessWidget {
  // declare a global key and get it trough Constructor

  MyMarker(this.globalKeyMyWidget);
  final GlobalKey globalKeyMyWidget;

  @override
  Widget build(BuildContext context) {
    // wrap your widget with RepaintBoundary and
    // pass your global key to RepaintBoundary
    return RepaintBoundary(
      key: globalKeyMyWidget,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 250,
            height: 180,
            decoration:
            BoxDecoration(color: Colors.black, shape: BoxShape.circle),
          ),
          Container(
              width: 220,
              height: 150,
              decoration:
              BoxDecoration(color: Colors.amber, shape: BoxShape.circle),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.accessibility,
                    color: Colors.white,
                    size: 35,
                  ),
                  Text(
                    'Widget',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}



