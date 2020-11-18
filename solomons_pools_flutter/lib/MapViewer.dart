import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:solomons_pools_flutter/provider.dart';
import 'event.dart';

class MapViewer extends StatefulWidget {
  MapViewer(List<Event> eventData);

  @override
  MapViewerState createState() => MapViewerState();
}

class MapViewerState extends State<MapViewer> {
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> eventsMarkers;

  @override
  void initState() {
    eventsMarkers = _getMarkers();
    super.initState();
  }

  double zoomVal = 16.0;
  MapType mapType = MapType.normal;

  @override
  Widget build(BuildContext context) {
    return Consumer<EventData>(builder: (context, value, child) {
      if (value.geteventsNumber() == 0)
        return Center(child: CircularProgressIndicator());
      else
        return Stack(
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
                markers: eventsMarkers,
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
                            icon:
                                Icon(Icons.zoom_out, color: Color(0xff6200ee)),
                            onPressed: () {
                              zoomVal--;
                              _minus(zoomVal);
                            }),
                        IconButton(
                            icon: Icon(Icons.zoom_in, color: Color(0xff6200ee)),
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
                            icon:
                                Icon(Icons.zoom_out, color: Color(0xff6200ee)),
                            onPressed: () {
                              zoomVal--;
                              _minus(zoomVal);
                            }),
                        IconButton(
                            icon: Icon(Icons.zoom_in, color: Color(0xff6200ee)),
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
        );
    });
  }

  Set<Marker> _getMarkers() {
    Set<Marker> markers;
    Provider.of<EventData>(context).allEvents.forEach((element) => {
          markers.add(Marker(
            markerId: MarkerId(element.eventName),
            position: LatLng(element.lat, element.lng),
            infoWindow: InfoWindow(title: element.eventName),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueViolet,
            ),
          ))
        });
    return markers;
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
