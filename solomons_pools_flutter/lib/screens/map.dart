import 'dart:async';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:solomons_pools_flutter/event.dart';
import 'package:solomons_pools_flutter/services/geolocator_service.dart';

class Map extends StatefulWidget {
  final Position initialPosition;

  Map(this.initialPosition);

  @override
  State<StatefulWidget> createState() => _MapState();
}

class _MapState extends State<Map> {
  List<Marker> allMarker = [];
  Future<List<Event>> futureEvents;

  Future<void> fetchEvents() async {
    var db = await mongo.Db.create(
        "mongodb+srv://solomons_pools:t0XEJRZIM9a5vZDL@cluster0.aob8x.mongodb.net/solomons_pools?readPreference=secondary&replicaSet=your_replSet_name&ssl=true");
    await db.open();
    final col = db.collection('events');
    final data = await col.find().toList();
    print(data);
   
    data.forEach((element) {
      allMarker.add(Marker(
          markerId: MarkerId(element['name']),
          draggable: false,
          position: LatLng(element['lat'], element['lng'])));
      
    });
  
    
  }

  final GeolocatorService geoService = GeolocatorService();
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState()  {
    geoService.getCurrentLocation().listen((position) {
      centerScreen(position);
    });
    fetchEvents();
    print(allMarker);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(widget.initialPosition.latitude,
                widget.initialPosition.longitude),
            zoom: 10.0,
          ),
          markers: Set.from(allMarker),
          mapType: MapType.terrain,
          myLocationEnabled: true,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
    );
  }

  Future<void> centerScreen(Position position) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
          target: LatLng(position.latitude, position.longitude), zoom: 18.0),
    ));
  }
}
