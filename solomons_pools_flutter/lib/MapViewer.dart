import 'dart:async';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapViewer extends StatefulWidget {
  @override
  MapViewerState createState() => MapViewerState();
}

class MapViewerState extends State<MapViewer> {
  Completer<GoogleMapController> _controller = Completer();
  Future<Set<Marker>> futureEvents = _fetchEvents();

  @override
  void initState() {
    super.initState();
  }

  double zoomVal = 16.0;
  MapType mapType = MapType.normal;

  @override
  Widget build(BuildContext context) {
    Widget children;
    return FutureBuilder(
        future: futureEvents,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            children = Center(child: Text("Loading"));
          }
          children = Scaffold(
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
                  child: GoogleMap(
                    mapType: mapType,
                    initialCameraPosition: CameraPosition(
                        target: LatLng(31.689, 35.1698), zoom: zoomVal),
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                    markers: snapshot.data,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Card(
                      child: FittedBox(
                        child: Column(
                          children: [
                            IconButton(
                                icon: Icon(Icons.zoom_out,
                                    color: Color(0xff6200ee)),
                                onPressed: () {
                                  zoomVal--;
                                  _minus(zoomVal);
                                }),
                            IconButton(
                                icon: Icon(Icons.zoom_in,
                                    color: Color(0xff6200ee)),
                                onPressed: () {
                                  zoomVal++;
                                  _plus(zoomVal);
                                }),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Card(
                      child: FittedBox(
                        child: Column(
                          children: [
                            IconButton(
                                icon: Icon(Icons.zoom_out,
                                    color: Color(0xff6200ee)),
                                onPressed: () {
                                  zoomVal--;
                                  _minus(zoomVal);
                                }),
                            IconButton(
                                icon: Icon(Icons.zoom_in,
                                    color: Color(0xff6200ee)),
                                onPressed: () {
                                  zoomVal++;
                                  _plus(zoomVal);
                                }),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
          return children;
        });
  }

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

  Future<void> _gotoLocation(double lat, double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(lat, long),
      zoom: 16.5,
      tilt: 50.0,
      bearing: 45.0,
    )));
  }
}

Future<Set<Marker>> _fetchEvents() async {
  var db = await mongo.Db.create(
      "mongodb+srv://solomons_pools:t0XEJRZIM9a5vZDL@cluster0.aob8x.mongodb.net/solomons_pools?readPreference=secondary&replicaSet=your_replSet_name&ssl=true");
  await db.open();
  final col = db.collection('events');
  final data = await col.find().toList();
  Set<Marker> eventsMarkers;

  for (var item in data) {
    eventsMarkers.add(Marker(
      markerId: MarkerId(item['name']),
      position: LatLng(item['lat'], item['long']),
      infoWindow: InfoWindow(title: item['name']),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueRed,
      ),
    ));
  }

  return eventsMarkers;
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
