import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'package:provider/provider.dart';
import 'package:solomons_pools_flutter/provider.dart';
import 'package:flutter_animation_set/widget/transition_animations.dart';

import 'event.dart';
import 'navbar.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  Future<List<Event>> futureEvents;

  List<Event> events = [];
  fetchEvents() async {
    var db = await mongo.Db.create(
        "mongodb+srv://solomons_pools:t0XEJRZIM9a5vZDL@cluster0.aob8x.mongodb.net/solomons_pools?readPreference=secondary&replicaSet=your_replSet_name&ssl=true");
    await db.open();
    final col = db.collection('events');
    final data = await col.find().toList();
    //return data;

    data.forEach(
      (element) => {
        events.add(
          Event(
            descriptionEvent: element['description'],
            eventName: element['name'],
            eventPicture: element['picture'],
            eventTime: element['eventTime'].toString(),
            eventDate: element['eventDate'].toString(),
          ),
        )
      },
    );

    Provider.of<EventData>(context, listen: false).setEvents(events);
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => BottomNavBar()));
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
                fit: BoxFit.cover)),
        child: Container(
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
          child: YYWave(),
        ));
  }
}
