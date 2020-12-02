import 'package:mongo_dart/mongo_dart.dart';
import 'package:solomons_pools_flutter/event.dart';

class Place {
  //Creator class for the creators of this app
  ObjectId objectId;
  String placeName;
  List<String> placePictures;
  String descriptionPlace;
  double lat;
  double lang;
  List<Event> events;
  Place({
    this.objectId,
    this.placeName,
    this.descriptionPlace,
    this.placePictures,
    this.lang,
    this.lat,
    this.events,
  });

  @override
  String toString() {
    return '{ ${this.placeName}, ${this.descriptionPlace}}';
  }
}
