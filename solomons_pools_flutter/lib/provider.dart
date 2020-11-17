import 'package:flutter/material.dart';

import 'event.dart';

class EventData extends ChangeNotifier {
  int _currentIndex = 0;
  List<Event> events = [];

  void setEvents(List<Event> e) {
    this.events = e;
    notifyListeners();
  }

  List<Event> get allEvents => this.events;

  int geteventsNumber() {
    return events.length;
  }

  get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
