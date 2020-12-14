import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'package:provider/provider.dart';
import 'package:solomons_pools_flutter/classes/event.dart';
import 'package:solomons_pools_flutter/classes/place.dart';
import 'package:solomons_pools_flutter/models/provider.dart';
import 'package:flutter_animation_set/widget/transition_animations.dart';
import 'package:solomons_pools_flutter/widgets/navbar.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  List<Event> events = [];
  List<Place> places = [];
  fetchEvents() async {
    var db = await mongo.Db.create(
        "mongodb+srv://solomons_pools:t0XEJRZIM9a5vZDL@cluster0.aob8x.mongodb.net/solomons_pools?readPreference=secondary&replicaSet=your_replSet_name&ssl=true");
    await db.open();
    final col1 = db.collection('events');
    final eventsData = await col1.find().toList();
    final col2 = db.collection('places');
    final placesData = await col2.find().toList();
    //return data;

    eventsData.forEach(
      (element) => {
        events.add(
          Event(
              descriptionEvent: element['description'],
              eventName: element['name'],
              eventPicture: element['picture'],
              eventTime: element['eventTime'].toString(),
              eventDate: element['eventDate'].toString(),
              place: element['placeName'],
              objectId: element['placeId']),
        )
      },
    );

    List<String> pics = []; //to parse the pictures
    placesData.forEach(
      (element) => {
        pics = [],
        element['pictures'].forEach((e) => {
              pics.add(e),
            }),
        places.add(
          Place(
            descriptionPlace: element['about'],
            placeName: element['name'],
            placePictures: pics,
            lang: element['lng'],
            lat: element['lat'],
            objectId: element['_id'],
          ),
        )
      },
    );

    Provider.of<EventData>(context, listen: false).setEvents(events);
    Provider.of<EventData>(context, listen: false).setPlaces(places);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => BottomNavBar(),
      ),
    );
  }

  void initState() {
    fetchEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/HELLO.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
        child: YYWave(),
      ),
    );
  }
}
