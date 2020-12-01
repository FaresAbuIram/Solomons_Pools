import 'package:mongo_dart/mongo_dart.dart';

class Place {
  //Creator class for the creators of this app
  ObjectId objectId;
  String placeName;
  List<String> placPicture;
  String descriptionPlace;
  double lat;
  double lang;
  Place(
      {this.objectId,
      this.placeName,
      this.descriptionPlace,
      this.placPicture,
      this.lang,
      this.lat});

  @override
  String toString() {
    return '{ ${this.placeName}, ${this.descriptionPlace}}';
  }
}
