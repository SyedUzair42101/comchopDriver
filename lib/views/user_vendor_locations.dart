import 'dart:convert';
import 'dart:typed_data';
import 'package:delivery_boy_application/details/alertbox.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import 'package:delivery_boy_application/http_services/htt_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:geolocator/geolocator.dart';

class uservendoes_location extends StatefulWidget {
  final userlat;
  final userlng;
  final vendorlat;
  final vendorlng;

  uservendoes_location(
      {Key? key, this.userlat, this.userlng, this.vendorlat, this.vendorlng})
      : super(key: key);

  @override
  State<uservendoes_location> createState() => _uservendoes_locationState();
}

class _uservendoes_locationState extends State<uservendoes_location> {
  static double customerlat = 0.0;
  final _prefs = SharedPreferences.getInstance();
  final  prefs = SharedPreferences.getInstance();
  static double customerlng = 0.0;
  static double vendorlat = 0.0;
  var data;
  static double vendorlng = 0.0;


  Future<Position> _getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print(error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }
  void nME()async{
    final query = "1600 Amphiteatre Parkway, Mountain View";
    var locations = await locationFromAddress("Gronausestraat 710, Enschede");
    var first = locations.first;
    print("${first.latitude} : ${first.longitude}");
  }

  Future getlatlong(ID) async {
    try {
      final SharedPreferences prefs = await _prefs;
      final gettoken = prefs.getString('new');
      var userHeader = {
        "Accept": "application/json",
        'Authorization': 'Bearer $gettoken',
      };
      final response = await http.get(
        Uri.parse(
          '${http_service().baseurl}getOrderLocation/$ID',

        ),
        headers: userHeader,
      );
      print( 'new data ${response.body} ');
      if (response.statusCode == 200) {
        var datas = (jsonDecode(response.body));
         //  print(datas['data']  );
        // print(datas['data']['customer']['lng']);
        // print(datas['data']['restaurant']['lat']);
        // print(datas['data']['restaurant']['lng']);
        var lat =double.parse(datas['data']['customer']['lat']) ;
        var lng = double.parse(datas['data']['customer']['lng']);
        var vendorlat =double.parse( datas['data']['restaurant']['lat']) ;
        var vendorlng = double.parse(datas['data']['restaurant']['lat']) ;
        print( 'new data $data');
        print(datas['data']['customer']['lat']);
        setState(() {
          data = datas;
          // customerlat = lat;
          // customerlng =lng;
          // vendorlat = vendorlat;
          // vendorlng = vendorlng;

        });
        print(customerlat);
        print(customerlng);
        print('new${vendorlat }' );
        print(vendorlng);

        // prefs.setDouble('customerlat',lat);
        // prefs.setDouble('customerlng',lng);
        // prefs.setDouble('resturentlat',vendorlat);
        // prefs.setDouble('returentlng',vendorlng );
        // print(prefs.getDouble('customerlat' )  ) ;
        // print(prefs.getDouble('customerlng' )  ) ;
        // print(prefs.getDouble('resturentlat' )  ) ;
        // print(prefs.getDouble('returentlng' )  ) ;
         return datas;
      } else {
        return null;
      }
    } on Exception catch (exception) {
      return null;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
  @override
  void initState() {

    super.initState();
    // http_service(). getlatlong(2);
     // customerlat = widget.userlat;
    // customerlng = widget.userlng;
    // vendorlat = widget.vendorlat;
    // vendorlng = widget.userlng;
    // print(customerlat);
    // print(customerlng);
    http_service().getlatlong(widget.userlat);
  }

  // getlatlongs() async {
  //   final _prefs = SharedPreferences.getInstance();
  //   final SharedPreferences prefs = await _prefs;
  //   setState(() {
  //     customerlat = widget.userlat;
  //     customerlng = widget.userlng;
  //     vendorlat = widget.vendorlat;
  //     vendorlng = widget.userlng;
  //     print(customerlat);
  //     print(customerlng);
  //   });
  // }
   GoogleMapController? mapController; //contrller for Google map
  Set<Marker> markers = Set(); //markers for google map
  // LatLng startLocation = LatLng(customerlat, customerlng);
  // LatLng endLocation = LatLng(vendorlat, vendorlng);

  static const LatLng _center = const LatLng(45.521563, -122.677433);

  loadData() {
    _getUserCurrentLocation().then((value) async {
      markers.add(Marker(
        markerId: const MarkerId('SomeId'),
        position: LatLng(value.latitude, value.longitude),
      ));

      CameraPosition _kGooglePlex = CameraPosition(
        target: LatLng(value.latitude, value.longitude),
        zoom: 14,
      );
      mapController!
          .animateCamera(CameraUpdate.newCameraPosition(_kGooglePlex));
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            myLocationEnabled: true,
            compassEnabled: true,
            myLocationButtonEnabled: true,
            zoomGesturesEnabled: true,
             //Map widget from google_maps_flutter package
            //enable Zoom in, out on map
            initialCameraPosition: CameraPosition(
              //innital position in map
              target: _center, //initial position
              zoom: 14.0, //initial zoom level
            ),

            markers: markers,
            mapType: MapType.normal,
            onMapCreated: (controller) async {
              setState(() async {
                mapController = controller;
              });
            },
          ),
          Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            left: 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(10),
                height: 250,
                width: MediaQuery.of(context).size.width,
                decoration: new BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Order Tracking',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                    ListTile(
                      subtitle: Text('Street: 48,Hunters Road, Vepery'),
                      leading: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(252, 186, 24, 0.2),
                            borderRadius: BorderRadius.circular(15)),
                        child: Icon(
                          Icons.add_location_rounded,
                          color: Color.fromRGBO(252, 186, 24, 1),
                          size: 20,
                        ),
                      ),
                      title: Text('Pickup location'),
                      onTap: () async{
                        BitmapDescriptor markerbitmap =
                        await BitmapDescriptor.fromAssetImage(
                          ImageConfiguration(),
                          "images/user.png",
                        );
                        setState(() {
                          vendorlat = double.parse(widget.vendorlat).toDouble() ;
                          vendorlng = double.parse(widget.vendorlng).toDouble();
                          print(vendorlat);
                          print(vendorlng);
                          LatLng endlocation  =
                          LatLng(vendorlat, vendorlng);
                          print('end location${endlocation}' );
                          markers.add(
                            Marker(
                              markerId: MarkerId(endlocation .toString()),
                              position:  endlocation,
                              rotation: -45,
                              icon: markerbitmap,
                            ),
                          );
                          mapController?.animateCamera(
                              CameraUpdate.newCameraPosition(CameraPosition(
                                  target: endlocation , zoom: 17)));

                        });
                      },
                    ),
                    ListTile(
                      subtitle: Text('Street: 48,Hunters Road, Vepery'),
                      leading: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(252, 186, 24, 0.2),
                            borderRadius: BorderRadius.circular(15)),
                        child: Icon(
                          Icons.add_location_rounded,
                          color: Color.fromRGBO(252, 186, 24, 1),
                          size: 20,
                        ),
                      ),
                      title: Text('Dropoff Location'),
                      onTap: () async {
                        BitmapDescriptor markerbitmap =
                            await BitmapDescriptor.fromAssetImage(
                          ImageConfiguration(),
                          "images/resturent.png",
                        );
                        setState(() {
                          customerlat = widget.userlat;
                          customerlng = widget.userlng;
                          LatLng startLocation =
                              LatLng(customerlat, customerlng);
                          print('start location${startLocation}' );
                          mapController?.animateCamera(
                              CameraUpdate.newCameraPosition(CameraPosition(
                                  target: startLocation, zoom: 17)));
                          markers.add(
                            Marker(
                              markerId: MarkerId(startLocation.toString()),
                              position: startLocation,
                              rotation: -45,
                              icon: markerbitmap,
                            ),
                          );
                        });

                      },
                    ),
                    // Container(
                    //     height: 40,
                    //     width: 140,
                    //     child: MaterialButton(
                    //         shape: RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(6)),
                    //         color: Color.fromRGBO(252, 186, 24, 1),
                    //         child: Text(
                    //           'Start',
                    //           style: TextStyle(
                    //             fontFamily: 'Roboto',
                    //             color: Colors.white,
                    //           ),
                    //         ),
                    //         onPressed: () async {
                    //
                    //             setState(() {
                    //               markers.add(Marker(
                    //                   markerId:
                    //                       MarkerId(_lastMapPosition.toString()),
                    //                   position: _lastMapPosition!,
                    //                   infoWindow: InfoWindow(
                    //                       title: "Pizza Parlour",
                    //                       snippet: "This is a snippet",
                    //                       onTap: () {}),
                    //                   onTap: () {},
                    //                   icon: BitmapDescriptor.defaultMarker));
                    //             });
                    //           }
                    //
                    //         )),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
