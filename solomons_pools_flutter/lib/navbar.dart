import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:provider/provider.dart';
import 'package:solomons_pools_flutter/landingPage.dart';
import 'package:solomons_pools_flutter/provider.dart';
import 'event.dart';
import 'eventsList.dart';
import 'main.dart';
import 'solomonPools.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;

List<Event> events = [];

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  Future<List<Event>> futureEvents;
  fetchEvents() async {
    var db = await mongo.Db.create(
        "mongodb+srv://solomons_pools:t0XEJRZIM9a5vZDL@cluster0.aob8x.mongodb.net/solomons_pools?readPreference=secondary&replicaSet=your_replSet_name&ssl=true");
    await db.open();
    final col = db.collection('events');
    final data = await col.find().toList();
    //return data;

    data.forEach((element) => {
          events.add(
            Event(
                descriptionEvent: element['description'],
                eventName: element['name'],
                eventPicture: element['picture'],
                eventTime: element['eventTime'].toString(),
                eventDate: element['eventDate'].toString(),
                lat: element['lat'],
                lng: element['lng']),
          )
        });

    Provider.of<EventData>(context, listen: false).setEvents(events);
    //success, parse json data
  }

  void initState() {
    fetchEvents();
    super.initState();
  }

  var currentTab = [LandingPage(), SoolmonPools(), EvenstList()];
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<EventData>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 70,
        backgroundColor: mainColor,
        title: Text(
          "برك سليمان",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: ArabicFonts.Tajawal,
            package: 'google_fonts_arabic',
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
      ),
      body: currentTab[provider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            title: Text(
              "الرئيسية",
              style: TextStyle(
                fontFamily: ArabicFonts.Tajawal,
                package: 'google_fonts_arabic',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.directions_boat,
            ),
            title: Text(
              "برك سليمان",
              style: TextStyle(
                fontFamily: ArabicFonts.Tajawal,
                package: 'google_fonts_arabic',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.event,
            ),
            title: Text(
              "الفعاليات",
              style: TextStyle(
                fontFamily: ArabicFonts.Tajawal,
                package: 'google_fonts_arabic',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
        currentIndex: provider.currentIndex,
        selectedItemColor: Color(0xFFF3A540),
        onTap: (index) {
          provider.currentIndex = index;
        },
      ),
    );
  }
}
