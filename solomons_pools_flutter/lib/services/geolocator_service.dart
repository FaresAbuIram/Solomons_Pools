import 'dart:async';

import 'package:geolocator/geolocator.dart';

class GeolocatorService {
  Stream<Position> getCurrentLocation() {
    return Geolocator.getPositionStream();
  }

  Future<Position> getInitialLocation() async {
    return Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
