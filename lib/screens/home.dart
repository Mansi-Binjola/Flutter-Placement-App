import 'package:flutter/material.dart';
import 'package:tpc_mac/screens/event_list.dart';
import 'package:tpc_mac/main.dart';
import 'package:tpc_mac/screens/ProfilePage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HomePage"),),
      body: Center(
        child:Text("MAIN PAGE") ,),
        drawer: Drawer(
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
                  return EventList();
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
                  Text('Events/Worshop', style:TextStyle(fontSize: 25,),),
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
    );
  }
}


