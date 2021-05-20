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
      resizeToAvoidBottomPadding: false,//removes bottom render error, but doesn't allow to scroll, TO BE CHECKED AGAIN
      backgroundColor: Colors.greenAccent,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/MAC.jpg"),
            fit: BoxFit.cover,
            color: Colors.black54,
            colorBlendMode: BlendMode.darken,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new FlutterLogo(// TPC LOGO to be added
                size: _iconAnimation.value * 100,
              ),
              new Form(
                child: new Theme(
                  data: new ThemeData(
                    brightness: Brightness.dark, primarySwatch: Colors.teal,
                    inputDecorationTheme: new InputDecorationTheme(
                      labelStyle: new TextStyle(
                        color: Colors.teal, fontSize: 20.0
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
                          height: 40.0,
                          minWidth: 60.0,
                          color: Colors.teal,
                          textColor: Colors.white,
                          child: new Text("Login"),
                          onPressed: () => {
                            if(loginAuth()== true){
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return HomePage();
                            }))
                            }else{
                              _scaffoldKey.currentState.showSnackBar(
                                SnackBar(
                                  content: Text("Unable to login"),
                                  duration: Duration(seconds:3),
                                  backgroundColor: Colors.black12,
                                )
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