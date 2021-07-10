import 'package:flutter/material.dart';
import 'package:tpc_mac/screens/data/EventClass.dart';


class EventDetailPage extends StatelessWidget {
  
  final Event event;
  EventDetailPage(this.event);
  @override
  Widget build(BuildContext context) {
    return  Stack(
    children: <Widget>[
      AppBar(
        title: Text(event.eventName),
        
      ),
      Positioned(
        top: 80,
        bottom: 80,
        left: 0,
        right: 0,
        child: Container(
          //color: Color.fromARGB(100, 100, 100, 100),
          child: Image.asset(
            "assets/images/"+event.eventPoster,
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
              color: Colors.white,
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