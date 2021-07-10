//import 'dart:io';

import 'dart:convert';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:tpc_mac/screens/UI/EventDetailPage.dart';
import 'package:tpc_mac/screens/UI/event_list.dart';
import 'package:tpc_mac/main.dart';
import 'package:tpc_mac/screens/UI/ProfilePage.dart';
import 'package:tpc_mac/screens/data/EventClass.dart';
//import 'package:tpc_mac/screens/data/homeDataClass.dart';
import 'package:flutter/services.dart';

class HomePage extends StatelessWidget {
  
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
  /*Future<List<HomeData>> _getData() async {// since it is a asynchronus function we use keyword async

    var data = await rootBundle.loadString('assets/homeData.json');
    var jsonData = await json.decode(data);
    List<HomeData> hData = [];
    for( var e in jsonData){
      HomeData event = HomeData(e['_id'],e["index"],e["picture"], e["name"]);
      hData.add(event);
    }
    print(hData.length);
    return hData;

  }*/
  

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HomePage"),
      
      ),
      resizeToAvoidBottomInset : false,
      
      body:ListView(
          children: [
            SizedBox(
              height:300.0,
              width: double.infinity,
              child: Carousel(
                dotSize: 4.0,
                dotSpacing: 15.0,
                indicatorBgPadding: 5.0,
                dotBgColor: Colors.transparent,
                images: [
                  //Add latest events and onTap move to description page
                  InkWell(
                    onTap: (){
                      print('1st Item Click');
                    },
                    child: Image.asset("assets/images/1.png",fit: BoxFit.cover,)
                  ),
                  InkWell(
                    onTap: (){
                      print('2nd Item Click');
                    },
                    child: Image.asset("assets/images/2.png",fit: BoxFit.cover,)
                  ),
                  InkWell(
                    onTap: (){
                      print('3rd Item Click');
                    },
                    child: Image.asset("assets/images/3.png",fit: BoxFit.cover,)
                  ),
                ],
              ),
            ),
            Divider(
              height:1, 
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                  Text(
                    "Events this Week",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    child: Text(
                      "more",
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 20,
                        decoration:TextDecoration.underline,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder:(context){
                        return EventList();
                      }),);
                    },
                  ),

                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              height: 270.0,
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
                      itemCount: 8,
                      reverse: false,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index){// code for how our event list will look like
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: new Column(
                            children: <Widget>[ 
                              InkWell(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(5.0)),    
                                child:Image.asset("assets/images/"+snapshot.data[index].eventPoster,height: 200,width:200),
                                onTap: (){
                                  Navigator.push(context, new MaterialPageRoute(builder:(context){
                                  return EventDetailPage(snapshot.data[index]);
                                }),);},
                              ),
                              Padding(padding:EdgeInsets.only(top: 10.0)),
                              Text(snapshot.data[index].eventName, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                              
                            ],
                          ),

                        
                        );
                        
                  },
                );}
              }),
            ),
            Divider(
              height:1,
              thickness:3,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                  Text(
                    "Events this Week",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    child: Text(
                      "more",
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 20,
                        decoration:TextDecoration.underline,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder:(context){
                        return EventList();
                      }),);
                    },
                  ),

                ],
              ),
            ),

            /*SingleChildScrollView(
              child:Container(
                    padding: EdgeInsets.all(8.0),
                    height: 500.0,
                    child: ListView.builder(
                      itemCount: 8,
                      reverse: false,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index){// code for how our event list will look like
                        return Container(child: ,);
                      },
              ),
            ),

            ),*/
            Divider(
              height:1, 
              thickness: 2,
            ),  
                /* Container(
                  width: 160.0,
                  color: Colors.red,
                ),
                Container(
                  width: 160.0,
                  color: Colors.blue,
                ),
                Container(
                  width: 160.0,
                  color: Colors.green,
                ),
                Container(
                  width: 160.0,
                  color: Colors.yellow,
                ),
                Container(
                  width: 160.0,
                  color: Colors.orange,
                ), 
            */
            /* ListView.builder(
              itemCount: 3,
              itemBuilder: (BuildContext context, int index){// code for how our event list will look like
                return Card(
                  child: ListTile(// widget for making list look good
                    leading: ClipRect(
                      child: Container(
                      height: 30.0,
                      width: 30.0,
                      //color: Colors.grey,
                      //borderRadius: BorderRadius.all(Radius.circular(10.0)),//add border radius here
                      child: Image.asset("assets/poster.jpeg",fit: BoxFit.fill,),//Icon(Icons.person,color: Colors.white, size: 50.0),//Image.asset(snapshot.data[index].eventPoster),//add image location here
                      //child: NetworkImage(
                      // snapshot.data[index].eventPoster
                      // ),
                    ),
                  ),
                  title:Text("EventName", 
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                  
                  
                  
                  //Text(
                    //snapshot.data[index].eventDate),
                  /* contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0 ),
                  
                  //isThreeLine: true,
                  //dense: true,
                  onTap: (){
                    Navigator.push(context, 
                    new MaterialPageRoute(builder: (context) => EventDetailPage(snapshot.data[index])));
                  }, */
                  ),
                  margin:  EdgeInsets.symmetric(vertical: 5),
                );
              },
            ), 
            
            */
          ], 
        ),
        drawer: Container(
          width: MediaQuery. of(context). size. width*0.75,
          child: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                
                //margin: EdgeInsets.only(top: 0.3),
                //padding: EdgeInsets.all(14),
                child: Row(
                  children:[
                    Column(
                      children: [
                        GestureDetector(
                          child: CircleAvatar(child: Icon(Icons.person,size: 40,)),
                          onTap: () {
                            // Update the state of the app
                            // ...
                            // Then close the drawer
                            Navigator.push(context, MaterialPageRoute(builder:(context){
                              return ProfilePage();
                            }),);
                          },
                        ),
                      ],
                    )
                  ]
                ),
                
              ),
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Icon(Icons.home,size: 30,),
                    Padding(padding: EdgeInsets.only(left:20,)),
                    Text('Home', style:TextStyle(fontSize: 25,),),
                    ],
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.push(context, MaterialPageRoute(builder:(context){
                    return HomePage();
                  }),);
                },
              ),

              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Icon(Icons.event_available,size: 30,),
                    Padding(padding: EdgeInsets.only(left:20,)),
                    Text('Events/Worshop', style:TextStyle(fontSize: 22,),),
                  ],
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.push(context, MaterialPageRoute(builder:(context){
                    return EventList();
                  }),);
                },
              ),

              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Icon(Icons.assignment_ind,size: 30,),
                    Padding(padding: EdgeInsets.only(left:20,)),
                    Text('Internship', style:TextStyle(fontSize: 25,),),
                    ],
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.push(context, MaterialPageRoute(builder:(context){
                    return EventList();
                  }),);
                },
              ),

              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Icon(Icons.work,size: 30,),
                    Padding(padding: EdgeInsets.only(left:20,)),
                    Text('Placement', style:TextStyle(fontSize: 25,),),
                    ],
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.push(context, MaterialPageRoute(builder:(context){
                    return EventList();
                  }),);
                },
              ),
              
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Icon(Icons.settings,size: 30,),
                    Padding(padding: EdgeInsets.only(left:20,)),
                    Text('Settings', style:TextStyle(fontSize: 25,),),
                    ],
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.push(context, MaterialPageRoute(builder:(context){
                    return EventList();
                  }),);
                },
              ),
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Icon(Icons.logout,size: 30,color: Colors.redAccent,),
                    Padding(padding: EdgeInsets.only(left:20,)),
                    Text('Logout', style:TextStyle(fontSize: 25,),),
                    ],
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.push(context, MaterialPageRoute(builder:(context){
                    return LoginPage();
                  }),);
                },
              ),

            ],
          ),
      ),
        ),
      
    );
  }
}


