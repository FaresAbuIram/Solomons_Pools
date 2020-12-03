import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:solomons_pools_flutter/place.dart';
import 'dialog.dart';
import 'event.dart';
import 'dart:ui';

class EventData extends ChangeNotifier {
  int _currentIndex = 0;
  List<Event> events = [];
  List<Place> places = [];
  double lat = 31.689, lng = 35.1698;

  void setPosition(double lat, double lng) {
    this.lat = lat;
    this.lng = lng;
    notifyListeners();
  }

  void setEvents(List<Event> e) {
    this.events = e;
    notifyListeners();
  }

  void setPlaces(List<Place> p) {
    this.places = p;
    notifyListeners();
  }

  List<Event> get allEvents => this.events;
  List<Place> get allPlaces => this.places;

  int geteventsNumber() {
    return events.length;
  }

  int getPlacesNumber() {
    return places.length;
  }

  get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  List<Event> getEventsForEachPlace(ObjectId id) {
    List<Event> eve = [];
    events.forEach((element) => {
          if (element.objectId == id)
            {
              eve.add(element),
            }
        });
    return eve;
  }

  Widget thereIsEventsOrNot(Place place) {
    if (place.events.length == 0) {
      return Padding(
        padding: const EdgeInsets.all(5),
        child: Text(
          'No events in this place',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: ArabicFonts.Cairo,
            package: 'google_fonts_arabic',
            color: Colors.blueGrey[800],
          ),
        ),
      );
    } else
      return Padding(
        padding: const EdgeInsets.all(5),
        child: Text(
          'Events in this place :',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: ArabicFonts.Cairo,
            package: 'google_fonts_arabic',
            color: Colors.blueGrey[800],
          ),
        ),
      );
  }

  Set<Marker> getMarkers(BuildContext context) {
    Set<Marker> markers = {};
    places.forEach(
      (element) => {
        element.events = getEventsForEachPlace(element.objectId),
        markers.add(
          Marker(
            markerId: MarkerId(element.placeName),
            position: LatLng(element.lat, element.lang),
            infoWindow: InfoWindow(
              title: element.placeName,
            ),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueAzure,
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
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              //height: MediaQuery.of(context).size.height * 0.33,
                              child: Container(
                                child: Image.network(
                                  '${element.placePictures[0]}',
                                  height: 200,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              width: MediaQuery.of(context).size.width,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Text(
                                '${element.placeName}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  fontFamily: ArabicFonts.Cairo,
                                  package: 'google_fonts_arabic',
                                  color: Colors.blueGrey[800],
                                ),
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
                                '${element.descriptionPlace}',
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ),
                            thereIsEventsOrNot(element),
                            Container(
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: element.events.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            CustomDialog(
                                          title:
                                              element.events[index].eventName,
                                          description: element
                                              .events[index].descriptionEvent,
                                          image: element
                                              .events[index].eventPicture,
                                          buttonText: "Okay",
                                        ),
                                      );
                                    },
                                    child: Card(
                                      elevation: 8.0,
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 10.0,
                                        vertical: 6.0,
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xFF00BFA6),
                                        ),
                                        child: ListTile(
                                          contentPadding: EdgeInsets.symmetric(
                                            horizontal: 20.0,
                                            vertical: 10.0,
                                          ),
                                          leading: Container(
                                            padding:
                                                EdgeInsets.only(right: 12.0),
                                            decoration: BoxDecoration(
                                              border: Border(
                                                right: BorderSide(
                                                  width: 1.0,
                                                  color: Colors.white24,
                                                ),
                                              ),
                                            ),
                                            child: Icon(
                                              Icons.event,
                                              color: Colors.white,
                                            ),
                                          ),
                                          title: Text(
                                            "${element.events[index].eventName}",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                                          subtitle: Row(
                                            children: <Widget>[
                                              Text(
                                                "Date : ${element.events[index].eventDate} at ${element.events[index].eventTime} ",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        )
      },
    );
    return markers;
  }
}
