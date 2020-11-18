import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'event.dart';

class EventData extends ChangeNotifier {
  int _currentIndex = 0;
  List<Event> events = [];

  void setEvents(List<Event> e) {
    this.events = e;
    notifyListeners();
  }

  List<Event> get allEvents => this.events;

  int geteventsNumber() {
    return events.length;
  }

  get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  Set<Marker> getMarkers() {
    Set<Marker> markers = {};
    print("this is: ");
    print(events);
    events.forEach((element) => {
          markers.add(Marker(
            markerId: MarkerId(element.eventName),
            position: LatLng(element.lat, element.lng),
            infoWindow: InfoWindow(title: element.eventName),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueViolet,
            ),
          ))
        });

    print(markers);
    return markers;
  }
}
