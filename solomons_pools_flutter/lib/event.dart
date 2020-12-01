class Event {
  //Creator class for the creators of this app
  String eventName;
  String eventPicture;
  String descriptionEvent;
  String eventTime;
  String eventDate;
  String place;
  Event({
    this.eventName,
    this.descriptionEvent,
    this.eventPicture,
    this.eventTime,
    this.eventDate,
    this.place,
  });

  @override
  String toString() {
    return '{ ${this.eventName}, ${this.place}, ${this.descriptionEvent}, ${this.eventDate} }';
  }
}
