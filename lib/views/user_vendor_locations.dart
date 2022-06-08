import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

import 'package:delivery_boy_application/http_services/htt_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';


class uservendoes_location extends StatefulWidget {
    final userlat;
    final userlng;
  const uservendoes_location({Key? key, this.userlat, this.userlng}) : super(key: key);

  @override
  State<uservendoes_location> createState() => _uservendoes_locationState();
}

class _uservendoes_locationState extends State<uservendoes_location> {
  static double customerlat =0.0 ;
  static double  customerlng = 0.0;
  static double vendorlat =0.0 ;
  static double  vendorlng = 0.0;
  @override
  void initState() {
    ;
    http_service().getlatlong(widget.userlat);
    addMarkers();
    getlatlongs();
    super.initState();
  }
  getlatlongs()async{
    final _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
  setState(() {
    customerlat =  prefs.getDouble('customerlat' )!;
    customerlng  =  prefs.getDouble('customerlng' )!;
    vendorlat =  prefs.getDouble('resturentlat' )!;
    vendorlng   =  prefs.getDouble('returentlng' )!;
    print(customerlat);
    print(customerlng);
  });
  }

   GoogleMapController? mapController; //contrller for Google map
  Set<Marker> markers = Set(); //markers for google map
  LatLng startLocation = LatLng(vendorlat,vendorlng);
  LatLng endLocation = LatLng(customerlat  ,customerlng );
  LatLng carLocation = LatLng(24.9841966,67.0617939);
   addMarkers() async {

    BitmapDescriptor markerbitmap = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      "images/resturent.png",
    );
    BitmapDescriptor markerbitmaps = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      "images/user.png",
    );
    markers.add(
        Marker( //add start location marker
          markerId: MarkerId(startLocation.toString()),
          position: startLocation, //position of marker
          infoWindow: InfoWindow( //popup info
            title: 'Starting Point ',
            snippet: 'Start Marker',
          ),
          icon: markerbitmap, //Icon for Marker
        )
    );

    // markers.add(
    //     Marker( //add start location marker
    //       markerId: MarkerId( 'new'),
    //       position: endLocation , //position of marker
    //       rotation:-45,
    //       infoWindow: InfoWindow( //popup info
    //         title: 'End Point ',
    //         snippet: 'End Markers',
    //       ),
    //       icon: markerbitmaps, //Icon for Marker
    //     ),
    //
    //
    // );
    markers.add(
      Marker( //add start location marker
        markerId: MarkerId(endLocation.toString()),
        position: endLocation, //position of marker
        rotation:-45,
        infoWindow: InfoWindow( //popup info
          title: 'End Point ',
          snippet: 'End Marker',
        ),
        icon: markerbitmaps, //Icon for Marker
      ),


    );

    // String imgurl = "https://www.fluttercampus.com/img/car.png";
    // Uint8List bytes = (await NetworkAssetBundle(Uri.parse(imgurl))
    //     .load(imgurl))
    //     .buffer
    //     .asUint8List();
    //
    // markers.add(
    //     Marker( //add start location marker
    //       markerId: MarkerId(carLocation.toString()),
    //       position: carLocation, //position of marker
    //       infoWindow: InfoWindow( //popup info
    //         title: 'Car Point ',
    //         snippet: 'Car Marker',
    //       ),
    //       icon: BitmapDescriptor.fromBytes(bytes), //Icon for Marker
    //     )
    // );
    //
    // setState(() {
    //   //refresh UI
    // });
  }

   @override
  Widget build(BuildContext context) {
    return  Scaffold(

        body:
        GoogleMap( //Map widget from google_maps_flutter package
          zoomGesturesEnabled: true, //enable Zoom in, out on map
          initialCameraPosition: CameraPosition( //innital position in map
            target: startLocation, //initial position
            zoom: 14.0, //initial zoom level
          ),
          markers: markers,
          mapType: MapType.normal,
          onMapCreated: (controller) {
            setState(() {
              mapController = controller;
            });
          },
        )
    );
  }
}





