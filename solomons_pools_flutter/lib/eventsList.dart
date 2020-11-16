import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'event.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'eventItem.dart';

class EvenstList extends StatefulWidget {
  EvenstList({Key key}) : super(key: key);

  @override
  _EvenstListState createState() => _EvenstListState();
}

class _EvenstListState extends State<EvenstList> {
  //This is the EventsList page:
  Future<List<Event>> futureEvents;

  Future<List<Event>> fetchEvents() async {
    var db = await mongo.Db.create(
        "mongodb+srv://solomons_pools:t0XEJRZIM9a5vZDL@cluster0.aob8x.mongodb.net/solomons_pools?readPreference=secondary&replicaSet=your_replSet_name&ssl=true");
    await db.open();
    final col = db.collection('events');
    final data = await col.find().toList();
    //return data;
    List<Event> events = [];
    data.forEach((element) => {
          events.add(
            Event(
              descriptionEvent: element['description'],
              eventName: element['name'],
              eventPicture: element['picture'],
              eventTime: element['eventTime'].toString(),
              eventDate: element['eventDate'].toString(),
            ),
          )
        });
    return events;

    //success, parse json data
  }

  void initState() {
    super.initState();
    this.futureEvents = fetchEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 10,
        ),
        child: Swiper(
          viewportFraction: 0.8,
          itemCount: 7,
          scale: 0.9,
          loop: true,
          itemBuilder: (BuildContext context, int index) {
            return FutureBuilder<List<Event>>(
              future: this.futureEvents,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Event> events = snapshot.data;
                  return EventItem(event: events[index]);
                } else if (snapshot.hasError) {
                  return Text("error ${snapshot.error}");
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
