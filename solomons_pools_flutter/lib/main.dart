import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:solomons_pools_flutter/services/geolocator_service.dart';
import './screens/map.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final geoService = GeolocatorService();
  @override
  Widget build(BuildContext context) {
    return FutureProvider(
      create: (context) => geoService.getInitialLocation(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("الخارطة",
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: ArabicFonts.Amiri,
                    package: 'google_fonts_arabic')),
          ),
          body: Consumer<Position>(
            builder: (context, position, widget) {
              print(position);
              return (position != null)
                  ? Map(position)
                  : Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}

class ListTest extends StatefulWidget {
  @override
  _ListTestState createState() => _ListTestState();
}

class _ListTestState extends State<ListTest> {
  t() async {
    var db = await mongo.Db.create(
        "mongodb+srv://solomons_pools:t0XEJRZIM9a5vZDL@cluster0.aob8x.mongodb.net/solomons_pools?readPreference=secondary&replicaSet=your_replSet_name&ssl=true");
    await db.open();
    final col = db.collection('events');
    final data = await col.find().toList();
    data.forEach((element) {
      print(element['name']);
    });
  }

  @override
  void initState() {
    super.initState();
    t();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("asdasf"),
    );
  }
}
