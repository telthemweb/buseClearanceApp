import 'dart:math';

import 'package:buseclear/clearance/home.dart';
import 'package:buseclear/users/login.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  String _password, _email, _fname, _lname;
  bool _isObscured = true;
  Color _eyeButtonColor = Colors.grey;

   void navigationHome() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  }

   void navigationSigninPageUp() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
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

  TextFormField buildNameTextFormField() {
    return TextFormField(
      onSaved: (nameInput) => _fname = nameInput,
      validator: (nameInput) {
        if (nameInput.isEmpty) {
          return 'Please enter your Name';
        }
      },
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          hintText: 'First Name',
          hintStyle: new TextStyle(color: Color(0xffffffff), fontSize: 18.0),
          prefixIcon: Icon(Icons.person, color: Color(0xffffffff))),
    );
  }

  TextFormField buildLnameTextFormField() {
    return TextFormField(
      onSaved: (lnameInput) => _lname = lnameInput,
      validator: (lnameInput) {
        if (lnameInput.isEmpty) {
          return 'Please enter your Surname';
        }
      },
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          hintText: 'Last Name',
          hintStyle: new TextStyle(color: Color(0xffffffff), fontSize: 18.0),
          prefixIcon: Icon(Icons.person, color: Color(0xffffffff))),
    );
  }

  TextFormField buildEmailTextFormField() {
    return TextFormField(
      onSaved: (emailInput) => _email = emailInput,
      validator: (emailInput) {
        if (emailInput.isEmpty) {
          return 'Please enter a valid Reg Number';
        }
      },
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          hintText: 'Reg Number',
          hintStyle: new TextStyle(color: Color(0xffffffff), fontSize: 18.0),
          prefixIcon: Icon(Icons.person, color: Color(0xffffffff))),
    );
  }

  TextFormField buildPasswordField() {
    return TextFormField(
      onSaved: (passwordInput) => _password = passwordInput,
      validator: (passwordInput) {
        if (passwordInput.isEmpty) {
          return 'Please enter a password';
        }
      },
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

  Align buildButtonSignUp() {
    return Align(
      child: SizedBox(
        height: 50.0,
        width: 270.0,
        child: FlatButton(
          onPressed: navigationHome,
          color: Colors.greenAccent,
          splashColor: Color(0xff34B7F1),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          child: new Text("Create Account",
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

//  void navigationPage() {
//    Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
//  }
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
            buildNameTextFormField(),
            SizedBox(
              height: 30.0,
            ),
            buildLnameTextFormField(),
            SizedBox(
              height: 30.0,
            ),
            buildEmailTextFormField(),
            SizedBox(
              height: 30.0,
            ),
            buildPasswordField(),
            SizedBox(
              height: 30.0,
            ),
            buildButtonSignUp(),
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
                        Text("You have an account already sign here?"),
                         SizedBox( height: 10.0,),
                        SizedBox(
                          height: 50.0,
                          width: 270.0,
                          child: FlatButton(
                            onPressed: navigationSigninPageUp,
                            color: Color(0xffFF0774),
                            splashColor: Color(0xff34B7F1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            child: new Text("Login here",
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
