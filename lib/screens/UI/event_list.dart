import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:backdrop/backdrop.dart';
import 'dart:async'; 
//import 'package:http/http.dart' as http; //for http request from server
import 'dart:convert'; // to deserialize json data
import 'package:tpc_mac/screens/data/EventClass.dart';
import 'package:tpc_mac/screens/UI/EventDetailPage.dart';




class EventList extends StatefulWidget {
  
  @override
  _EventListState createState() => _EventListState();

}

class _EventListState extends State<EventList> {
  Future<List<Event>> _getEvents() async {// since it is a asynchronus function we use keyword async

    //var data = await http.get("http://www.json-generator.com/api/json/get/cpsYZzlKyG?indent=2");//http://www.json-generator.com/api/json/get/cgiboTmTdu?indent=2");//await is used here for waiting for data to generate
    var data = await rootBundle.loadString('assets/appData.json');
    
    var jsonData = await json.decode(data);
    //var jsonData = json.decode(data.body);

    List<Event> events = [];

    for( var e in jsonData){
      Event event = Event(e["index"],e["eventName"], e["about"], e["eventPoster"], e["eventDate"], e["eventTime"], e["email"], e["phone"]);
      events.add(event);
    }

    //print(events.length);
    return events;

  }  
  @override
  
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Events"),
      ),
      body: Container(
        child: FutureBuilder(
          future: _getEvents(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if( snapshot.data == null ){
              return Container(
                child:Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.grey,
                    strokeWidth: 4,

                  )
                )
              );
            } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index){// code for how our event list will look like
                  return Card(
                    child: ListTile(// widget for making list look good
                      leading: ClipRect(
                        child: Container(
                        height: 200.0,
                        width: 60.0,
                        //color: Colors.grey,
                        //borderRadius: BorderRadius.all(Radius.circular(10.0)),//add border radius here
                        child: Image.asset("assets/images/"+snapshot.data[index].eventPoster,fit: BoxFit.fill,),//Icon(Icons.person,color: Colors.white, size: 50.0),//Image.asset(snapshot.data[index].eventPoster),//add image location here
                        //child: NetworkImage(
                        // snapshot.data[index].eventPoster
                        // ),
                      ),
                    ),
                    title:Text(snapshot.data[index].eventName, 
                      style: TextStyle(
                        fontSize: 22.0,
                      ),
                    ),
                    
                    
                    subtitle: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(padding: EdgeInsets.only(top: 10.0)),
                          Column(
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                              snapshot.data[index].about,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: TextStyle(
                                fontSize:15.0,
                              ),
                              ),
                            ]
                          ),
                          Padding(padding: EdgeInsets.only(top: 10.0)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children:[
                              Icon(Icons.calendar_today, size:20.0),
                              Text(snapshot.data[index].eventDate,style: TextStyle(fontSize:16.0),),
                              VerticalDivider(color: Colors.black,thickness: 2,),
                              Icon(Icons.alarm,size: 20.0),
                              Text(snapshot.data[index].eventTime,style: TextStyle(fontSize:16.0),),
                            ],
                          ),
                          
                        ],
                      ),
                      ),
                    
                    //Text(
                      //snapshot.data[index].eventDate),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0 ),
                    
                    //isThreeLine: true,
                    //dense: true,
                    onTap: (){
                      Navigator.push(context, new MaterialPageRoute(builder:(context){
                      return EventDetailPage(snapshot.data[index]);
                    }),);
                      //Navigator.push(context, 
                      //new MaterialPageRoute(builder: (context) => EventDetailPage(snapshot.data[index])));
                    },
                    ),
                    margin:  EdgeInsets.symmetric(vertical: 5),
                  );
                }  
              );
            }
          },
        )
      ),
    );
  }
}

/*class EventDetailPage extends StatelessWidget {
  
  final Event event;
  EventDetailPage(this.event);
  @override
  Widget build(BuildContext context) {
    return  Stack(
    children: <Widget>[
      AppBar(
        title: Text("EventName"),
        
      ),
      Positioned(
        top: 80,
        bottom: 80,
        left: 0,
        right: 0,
        child: Container(
          //color: Color.fromARGB(100, 100, 100, 100),
          child: Image.asset(
            "assets/poster.jpeg",
            //event.eventPoster,
            fit: BoxFit.fill,
          ),
        ),
      ),
      DraggableScrollableSheet(
        initialChildSize: 0.5,
        minChildSize: 0.4,
        builder: (BuildContext context, ScrollController scrollController){
          
          return Container(
            decoration: BoxDecoration(
              color:Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30)
              ) 
            ),
            //color: Colors.white,
            child: MaterialApp(
              /*theme: ThemeData(
                canvasColor: Colors.transparent,
              ),*/
              home:ListView.builder(
                
              controller: scrollController,
              itemCount: 1,
              itemBuilder: (BuildContext context, int index){
                return Material(
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Details", style:TextStyle(fontSize:35.0),),
                      Padding(padding: EdgeInsets.only(top: 20.0,)),
                      Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(20),
                            child:Text(
                              event.about,
                          
                          //overflow: TextOverflow.ellipsis,
                          //maxLines: 3,
                          style: TextStyle(
                            fontSize:16.0,
                            height: 1.4,
                            letterSpacing: 0.5,
                          ),
                          ),
                          ),
                        ]
                      ),
                      
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children:[
                            Icon(Icons.calendar_today, size:22.0),
                            Text(event.eventDate,style: TextStyle(fontSize:20.0),),
                            VerticalDivider(color: Colors.black,thickness: 2,),
                            Icon(Icons.alarm,size: 22.0),
                            Text(event.eventTime,style: TextStyle(fontSize:20.0),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(30),
                        child:FloatingActionButton.extended(  
                          onPressed: () {}, 
                          backgroundColor: Colors.black,
                          //icon: Icon(Icons.save),  
                          label: Text("Register", style: TextStyle(fontSize: 20),),  
                        ),
                      ),
                    ],
                  ),
                );
              }
            ),
          ),
        );
      },
    )
    ],
    );  
    /*Scaffold(
      appBar: AppBar(
        title: Text(event.eventName),
      ),
      body: SizedBox.expand(
        child: DraggableScrollableSheet(
          builder: (BuildContext context, ScrollController scrollController) {
            return SingleChildScrollView(
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Description"),
                  Padding(padding: EdgeInsets.only(top: 10.0)),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text(event.about),
                  ),       
                  /*Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                      event.about,
                      overflow: TextOverflow.ellipsis,
                      //maxLines: 3,
                      style: TextStyle(
                        fontSize:15.0,
                      ),
                      ),
                    ]
                  ),
                  */
                  //Text(event.about,maxLines: 30,),
                  /*Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children:[
                      Icon(Icons.calendar_today, size:20.0),
                      Text(event.eventDate,style: TextStyle(fontSize:16.0),),
                      VerticalDivider(color: Colors.black,thickness: 2,),
                      Icon(Icons.alarm,size: 20.0),
                      Text(event.eventTime,style: TextStyle(fontSize:16.0),),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 10.0)),
                  FloatingActionButton.extended(  
                    onPressed: () {},  
                    icon: Icon(Icons.save),  
                    label: Text("Save"),  
                  ),*/
                ],
              ),
            );
          },
        ),
      ),
    );*/
  }
}
*/



/*class Event{
  final int index;
  final String eventName;
  final String about;
  final String eventPoster;
  final String eventTime;
  final String eventDate;
  final String email;
  final String phone;

  Event( this.index, this.eventName, this.about, this.eventPoster, this.eventDate, this.eventTime, this.email, this.phone);
}*/