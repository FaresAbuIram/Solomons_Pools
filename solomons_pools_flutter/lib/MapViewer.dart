import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:solomons_pools_flutter/provider.dart';

class MapViewer extends StatefulWidget {
  @override
  MapViewerState createState() => MapViewerState();
}

class MapViewerState extends State<MapViewer> {
  Completer<GoogleMapController> _controller = Completer();
  Future<Position> position;

  @override
  void initState() {
    position = getInitialLocation();
    super.initState();
  }

  double zoomVal = 16.0;
  MapType mapType = MapType.hybrid;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: position,
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              toolbarHeight: 70,
              backgroundColor: Color(0xFFF3A540),
              title: Text(
                "برك سليمان",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: ArabicFonts.Tajawal,
                  package: 'google_fonts_arabic',
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(15),
                ),
              ),
            ),
            body: Stack(children: [
              Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: GestureDetector(
                    child: GoogleMap(
                      mapType: mapType,
                      initialCameraPosition: CameraPosition(
                          target: LatLng(31.689, 35.1698), zoom: zoomVal),
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                      markers:
                          Provider.of<EventData>(context).getMarkers(context),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Card(
                    child: FittedBox(
                        child: FlatButton(
                      child: Icon(Icons.location_searching),
                      onPressed: () {
                        print(snapshot.data);
                      },
                    )),
                  ),
                ),
              ),
            ]),
          );
        });
  }

/*
  Future<void> _minus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(31.689, 35.1698), zoom: zoomVal)));
  }

  Future<void> _plus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(31.689, 35.1698), zoom: zoomVal)));
  }

  Future<void> _returnToOrigin() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(31.689, 35.1698), zoom: 16.0)));
  }

  Future<void> _gotoLocation(double lat, double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(lat, long),
      zoom: 16.5,
      tilt: 50.0,
      bearing: 45.0,
    )));
  }*/

  Future<Position> getInitialLocation() async {
    return Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}

//Solmons Pools markers
List<Marker> markers = [
  new Marker(
    markerId: MarkerId('solmonsPool1'),
    position: LatLng(31.6892, 35.168),
    infoWindow: InfoWindow(title: 'Solmons Pool 1'),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueViolet,
    ),
  ),
  new Marker(
    markerId: MarkerId('solmonsPool2'),
    position: LatLng(31.689, 35.1698),
    infoWindow: InfoWindow(title: 'Solmons Pool 2'),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueViolet,
    ),
  ),
  new Marker(
    markerId: MarkerId('solmonsPool3'),
    position: LatLng(31.6884, 35.1719),
    infoWindow: InfoWindow(title: 'Solmons Pool 3'),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueViolet,
    ),
  )
];
