class Creator {
  //Creator class for the creators of this app
  String eventName;
  String eventPicture;
  String descriptionEvent;
  String eventTime;
  String eventDate;
  Creator(String eventName, String descriptionEvent, String eventPicture,
      String eventTime, String eventDate) {
    this.eventName = eventName;
    this.descriptionEvent = descriptionEvent;
    this.eventPicture = eventPicture;
    this.eventDate = eventDate;
    this.eventTime = eventTime;
  }
}
