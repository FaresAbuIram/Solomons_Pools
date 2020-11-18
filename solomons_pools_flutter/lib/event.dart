class Event {
  //Creator class for the creators of this app
  String eventName;
  String eventPicture;
  String descriptionEvent;
  String eventTime;
  String eventDate;
  double lat, lng;
  Event(
      {this.eventName,
      this.descriptionEvent,
      this.eventPicture,
      this.eventTime,
      this.eventDate,
      this.lat,
      this.lng});

  @override
  String toString() {
    return '{ ${this.eventName}, ${this.descriptionEvent}, ${this.eventDate} }';
  }
}
