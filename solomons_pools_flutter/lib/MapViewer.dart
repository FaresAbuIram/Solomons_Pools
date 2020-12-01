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
    position = getMyLocation();
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
          body: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: GestureDetector(
                  child: GoogleMap(
                    myLocationEnabled: true,
                    mapType: mapType,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(31.689, 35.1698),
                      zoom: zoomVal,
                    ),
                    onMapCreated: (
                      GoogleMapController controller,
                    ) {
                      _controller.complete(controller);
                    },
                    markers:
                        Provider.of<EventData>(context).getMarkers(context),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Card(
                    child: FittedBox(
                        child: FlatButton(
                      child: Icon(
                        Icons.home,
                      ),
                      onPressed: () {
                        goToSolmon();
                      },
                    )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Card(
                    child: FittedBox(
                      child: FlatButton(
                        child: Icon(
                          Icons.location_searching,
                        ),
                        onPressed: () {
                          getMyLocation();
                          goToMyLocation(
                              Provider.of<EventData>(context, listen: false)
                                  .lat,
                              Provider.of<EventData>(context, listen: false)
                                  .lng);
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<Position> getMyLocation() async {
    var pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(pos);
    Provider.of<EventData>(context, listen: false)
        .setPosition(pos.latitude, pos.longitude);
    return pos;
  }

  Future<void> goToSolmon() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(31.689, 35.1698), zoom: zoomVal)));
  }

  Future<void> goToMyLocation(double lat, double lng) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(lat, lng), zoom: 17, bearing: -50, tilt: 50)));
  }
}
