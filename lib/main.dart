import 'package:flutter/material.dart';
//import 'package:tpc_mac/screens/event_list.dart';

import 'package:tpc_mac/screens/UI/home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new LoginPage(),
      theme: new ThemeData(
        primarySwatch: Colors.blue
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState(); 
   
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;
  @override
  void initState(){
    super.initState();
    _iconAnimationController = new AnimationController(
      vsync: this, duration: new Duration(milliseconds: 500));
    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController,curve: Curves.easeInOut);
    _iconAnimation.addListener(()=> this.setState((){}));
    _iconAnimationController.forward();
  }
  bool loginAuth(){
    
    return true;
  }
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,//removes bottom render error, but doesn't allow to scroll, TO BE CHECKED AGAIN
      backgroundColor: Colors.white,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/images/app Front.png"),
            fit: BoxFit.fill,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: _iconAnimation.value * 80,
                height: _iconAnimation.value * 80,
                decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage("assets/mac_logo.jpg"),
                  fit: BoxFit.fill
                ),
                ),
              ),/*
              new Image.asset(// TPC LOGO to be added
                "assets/mac_logo.jpg",
                shape:BoxShape.circle,
                height: _iconAnimation.value * 100,
                width: _iconAnimation.value * 100,
                
              ),*/
              Padding(padding: EdgeInsets.all(8.0)),
              new Text("Training and Placement Cell", 
              style: TextStyle(fontSize:_iconAnimation.value * 25,
),
              ),
              new Form(
                child: new Theme(
                  data: new ThemeData(
                    brightness: Brightness.light,
                    inputDecorationTheme: new InputDecorationTheme(
                      labelStyle: new TextStyle(
                        color: Colors.black87, fontSize: 20.0
                      )
                    ) ),
                  
                  
                  child: new Container(
                    padding: const EdgeInsets.all(40.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new TextFormField(
                          decoration: new InputDecoration(
                          labelText:"Enter Email",
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        new TextFormField(
                          decoration: new InputDecoration(
                          labelText:"Enter Password",
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,//hides the text
                        ),
                        new Padding(padding: const EdgeInsets.only(top: 40.0)),
                        new MaterialButton(
                          height: 50.0,
                          minWidth: 70.0,
                          color: Colors.black87,
                          textColor: Colors.white,
                          child: new Text("Login"),
                          onPressed: () => {
                            if(loginAuth()== true){
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return HomePage();
                            }))
                            }else{
                                SnackBar(
                                  content: Text("Unable to login"),
                                  duration: Duration(seconds:3),
                                  backgroundColor: Colors.black12,
                                )
                            }
                          },
                          splashColor: Colors.black12,
                          ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}