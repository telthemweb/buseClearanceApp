import 'package:buseclear/users/login.dart';
import 'package:flutter/material.dart';
import 'dart:async';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Buclear',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  startTime() async {
    var _duration = new Duration(seconds: 5);
    return new Timer(_duration, navigationPage);
  }
  void navigationPage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(color:Color(0xFF162160)),
      child: Container(
        alignment: Alignment.center,
        color: Color(0xFF162160),
        margin: new EdgeInsets.all(30.0),
        width: 250.0,
        height: 250.0,
        child: new Image.asset(
          'assets/buse.png',
        ),
      ),

    );
  }
}
