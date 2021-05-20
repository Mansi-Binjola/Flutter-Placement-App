class Event{
  final int index;
  final String eventName;
  final String about;
  final String eventPoster;
  final String eventTime;
  final String eventDate;
  final String email;
  final String phone;

  Event( this.index, this.eventName, this.about, this.eventPoster, this.eventDate, this.eventTime, this.email, this.phone);
  /*Future<List<Event>> getEvents() async {// since it is a asynchronus function we use keyword async

    var data = await http.get("http://www.json-generator.com/api/json/get/cpsYZzlKyG?indent=2");//http://www.json-generator.com/api/json/get/cgiboTmTdu?indent=2");//await is used here for waiting for data to generate
    
    var jsonData = json.decode(data.body);

    List<Event> events = [];

    for( var e in jsonData){
      Event event = Event(e["index"],e["eventName"], e["about"], e["eventPoster"], e["eventDate"], e["eventTime"], e["email"], e["phone"]);
      events.add(event);
    }

    print(events.length);
    return events;
  }*/
}