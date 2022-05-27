import 'dart:async';

import 'package:delivery_boy_application/http_services/htt_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';

class location_data extends http_service {
  currentlocation() async {
    Location location = new Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _locationData = await location.getLocation();
    location.onLocationChanged.listen((LocationData currentLocation) {
      latitude = currentLocation.longitude;
      longtitude = currentLocation.latitude;
      http_service()
          .updatelocation(currentLocation.longitude, currentLocation.latitude);

      // Use current location
    });
  }
}
