import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
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

  Set<Marker> getMarkers(BuildContext context) {
    Set<Marker> markers = {};
    events.forEach((element) => {
          markers.add(Marker(
            markerId: MarkerId(element.eventName),
            position: LatLng(element.lat, element.lng),
            infoWindow: InfoWindow(
              title: element.eventName,
            ),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueRose,
            ),
            onTap: () {
              showBarModalBottomSheet(
                context: context,
                expand: false,
                enableDrag: true,
                bounce: true,
                elevation: 2,
                duration: Duration(milliseconds: 600),
                builder: (context) => SingleChildScrollView(
                  controller: ModalScrollController.of(context),
                  child: Container(
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              child: Image.network(
                                '${element.eventPicture}',
                                fit: BoxFit.fitWidth,
                              ),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.35,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Text(
                                '${element.eventName}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  fontFamily: ArabicFonts.Cairo,
                                  package: 'google_fonts_arabic',
                                  color: Colors.blueGrey[800],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 8,
                                right: 8,
                                bottom: 8,
                                top: 10,
                              ),
                              child: Text(
                                '${element.descriptionEvent}',
                                style: TextStyle(fontSize: 17),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 8,
                                right: 8,
                                bottom: 8,
                                top: 10,
                              ),
                              child: Text(
                                'Event date : ${element.eventTime}',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 8,
                                right: 8,
                                bottom: 40,
                                top: 10,
                              ),
                              child: Text(
                                'Event Time : ${element.eventDate}',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ))
        });
    return markers;
  }
}
