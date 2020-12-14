import 'package:mongo_dart/mongo_dart.dart';

class Event {
  //Creator class for the creators of this app
  String eventName;
  String eventPicture;
  String descriptionEvent;
  String eventTime;
  String eventDate;
  String place;
  ObjectId objectId;
  Event(
      {this.eventName,
      this.descriptionEvent,
      this.eventPicture,
      this.eventTime,
      this.eventDate,
      this.place,
      this.objectId});

  @override
  String toString() {
    return '{ ${this.eventName}, ${this.place}, ${this.descriptionEvent}, ${this.eventDate} }';
  }
}
