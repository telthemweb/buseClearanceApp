import 'dart:async';
import 'dart:math';
import 'package:buseclear/admin/admin.dart';
import 'package:buseclear/exam/exam.dart';
import 'package:buseclear/users/setup/appDart.dart';
import 'package:buseclear/users/signup.dart';
// import 'package:buseclear/users/progress.dart';
import 'package:flutter/material.dart';
import 'package:buseclear/clearance/home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatefulWidget {
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
   TextEditingController controllerUser = new TextEditingController();
   TextEditingController controllerPass = new TextEditingController();
   var erroMessage ='';
   final _formKey = GlobalKey<FormState>();
  bool _isObscured = true;
  Color _eyeButtonColor = Colors.grey;

  Future<List> login() async{
    var url = 'http://buseclearance.000webhostapp.com/login.php';
   var response = await http.post(url,body:{
       "username": controllerUser.text,
       "password": controllerPass.text,
    });

//     TextEditingController user=new TextEditingController();
// TextEditingController pass=new TextEditingController();
   
    var datauser= json.decode(response.body);
    if(datauser.length == 0){
      setState(() {
        erroMessage ='Username or Password is incorect please try again';
      });
    }
    else{
      if(datauser[0]["usertype"]=='Admin'){
        // final snack = SnackBar(
        //   content: Text(datauser[0]["username"]+"successfully logged in"),
        //   backgroundColor: Colors.green,
        // );
        // Scaffold.of(context).showSnackBar(snack);
        Navigator.push(context, MaterialPageRoute(builder: (context) => Admindashboard(data:datauser)));
      
      }
       else if(datauser[0]["usertype"]=='Exam'){
        // final snack = SnackBar(
        //   content: Text(datauser[0]["username"]+"successfully logged in"),
        //   backgroundColor: Colors.green,
        // );
        // Scaffold.of(context).showSnackBar(snack);
        Navigator.push(context, MaterialPageRoute(builder: (context) => ExamDashboard(data:datauser)));
      }
      else if(datauser[0]["usertype"]=='Student'){
        // final snack = SnackBar(
        //   content: Text(datauser[0]["username"]+"successfully logged in"),
        //   backgroundColor: Colors.green,
        // );
        // Scaffold.of(context).showSnackBar(snack);
        Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard(data:datauser)));
      }
    setState(() {
     var username = datauser[0]['username'];
    });
    }
    return  datauser;
  }
 
   void navigationSignPageUp() {
    // final snack = SnackBar(
    //       content: Text("Welcome no!!"),
    //       backgroundColor: Colors.green,
    //     );
    //     Scaffold.of(context).showSnackBar(snack);
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()));
  }

 
  Padding buildTitle() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          "Welcome to",
          style: new TextStyle(fontSize: 15.0, color: Color(0XFFf5f211)),
        ),
      ),
    );
  }

  Padding buildTitleLine() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          "Final Year Clearance",
          style: new TextStyle(fontSize: 19.0, color: Color(0XFFf5f211)),
        ),
      ),
    );
  }

  Padding buildLogo() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: 124.0,
          height: 124.0,
          child: ClipOval(
            clipper: new CirleClipper(),
            child: Image(
              image: AssetImage('assets/holder.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  TextFormField buildEmailTextFormField() {
    return TextFormField(
       controller: controllerUser,
     
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          hintText: 'Reg Number',
          hintStyle: new TextStyle(color: Color(0xffffffff), fontSize: 18.0),
          prefixIcon: Icon(Icons.person, color: Color(0xffffffff))),
    );
  }

  TextFormField buildPasswordField() {
    return TextFormField(
      controller: controllerPass,
     
      decoration: InputDecoration(
          hintText: 'Password',
          hintStyle: new TextStyle(color: Color(0xffffffff), fontSize: 18.0),
          prefixIcon: Icon(Icons.vpn_key, color: Color(0xffffffff)),
          suffixIcon: IconButton(
            onPressed: () {
              if (_isObscured) {
                setState(() {
                  _isObscured = false;
                  _eyeButtonColor = Colors.green;
                });
              } else {
                setState(() {
                  _isObscured = true;
                  _eyeButtonColor = Colors.grey;
                });
              }
            },
            icon: Icon(
              Icons.remove_red_eye,
              color: _eyeButtonColor,
            ),
          )),
      obscureText: _isObscured,
      style: TextStyle(color: Colors.white),
    );
  }

 

  Align buildButtonLogin() {
    return Align(
      child: SizedBox(
        height: 50.0,
        width: 270.0,
        child:  FlatButton(
          onPressed: (){
              login();
           
          },
          color: Color(0xffFF0774),
          splashColor: Color(0xff34B7F1),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          child: new Text("Login",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 23.0,
                  fontWeight: FontWeight.bold)),      
        ),
      ),
    );
  }



  Padding buildTextInfo() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              child: Align(
                alignment: Alignment.center,
                child: new Text(
                  'By clicking Login you agree with',
                  style: TextStyle(fontSize: 15.0, color: Colors.grey),
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Container(
              child: Align(
                alignment: Alignment.center,
                child: new Text(
                  'our  Terms and Conditions',
                  style: TextStyle(fontSize: 13.0, color: Colors.blue),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF242644),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.fromLTRB(22.0, 0.0, 22.0, 22.0),
          children: <Widget>[
            SizedBox(
              height: kToolbarHeight,
            ),
            buildTitle(),
            buildTitleLine(),
            // SizedBox(height: 50.0,),
            buildLogo(),
            SizedBox(
              height: 20.0,
            ),
            buildEmailTextFormField(),
            SizedBox(
              height: 30.0,
            ),
            buildPasswordField(),
            SizedBox(
              height: 30.0,
            ),
            buildButtonLogin(),
            SizedBox(
              height: 10.0,
            ),
            buildTextInfo(),
            SizedBox(
              height: 10.0,
            ),
            Center(
              child: Column(
                children: <Widget>[
                  Center(
                    child: Column(
                      children: <Widget>[
                        Text("You don't have an Account"),
                        SizedBox( height: 10.0,),
                        SizedBox(
                          height: 50.0,
                          width: 270.0,
                          child: FlatButton(
                            onPressed: navigationSignPageUp,
                            color: Colors.greenAccent,
                            splashColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            child: new Text("Create Account",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23.0,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CirleClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return new Rect.fromCircle(
      center: new Offset(size.width / 2, size.height / 2),
      radius: min(size.width, size.height) / 2,
    );
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}
