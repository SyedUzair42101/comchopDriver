import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class uservendoes_location extends StatefulWidget {
  const uservendoes_location({Key? key}) : super(key: key);



  @override
  State<uservendoes_location> createState() => _uservendoes_locationState();
}

class _uservendoes_locationState extends State<uservendoes_location> {
  final Set<Marker> markers = new Set();
  static const LatLng _center = const LatLng(24.986557, 67.0644278);

  @override
  Widget build(BuildContext context) {
    markers.add(Marker( //add first marker
      markerId: MarkerId( "1" .toString()),
      position: LatLng(24.986557, 67.0644278), //position of marker
      infoWindow: InfoWindow( //popup info
        title: 'My Custom Title ',
        snippet: 'My Custom Subtitle',
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));

    markers.add(Marker( //add second marker
      markerId: MarkerId("1"),
      position: LatLng(27.7099116, 85.3132343), //position of marker
      infoWindow: InfoWindow( //popup info
        title: 'My Custom Title ',
        snippet: 'My Custom Subtitle',
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));
    return GoogleMap( //Map widget from google_maps_flutter package
      markers: markers, initialCameraPosition: CameraPosition(
      target: _center,
      zoom: 14.0,
    ) , //markers to show on map
    );
  }
}
