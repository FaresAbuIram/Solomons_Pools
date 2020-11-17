class Event {
  //Creator class for the creators of this app
  String eventName;
  String eventPicture;
  String descriptionEvent;
  String eventTime;
  String eventDate;
  Event(
      {this.eventName,
      this.descriptionEvent,
      this.eventPicture,
      this.eventTime,
      this.eventDate});

  factory Event.fromJson(dynamic json) {
    return Event(
      eventName: json['name'],
      descriptionEvent: json['description'],
      eventPicture: json['picture'],
      eventTime: json['eventTime'].toString(),
      eventDate: json['eventDate'].toString(),
    );
  }

  @override
  String toString() {
    return '{ ${this.eventName}, ${this.descriptionEvent}, ${this.eventDate} }';
  }
}
