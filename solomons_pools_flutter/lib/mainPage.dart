import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:solomons_pools_flutter/eventsList.dart';
import 'package:solomons_pools_flutter/solomonPools.dart';
import 'landingPage.dart';
import 'main.dart';

class MainPageStatefulWidget extends StatefulWidget {
  MainPageStatefulWidget({Key key}) : super(key: key);

  @override
  _MainPageStatefulWidgetState createState() => _MainPageStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MainPageStatefulWidgetState extends State<MainPageStatefulWidget> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    LandingPage(),
    SoolmonPools(),
    EvenstList(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
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
            icon: Icon(Icons.event),
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
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFFF3A540),
        onTap: _onItemTapped,
      ),
    );
  }
}
