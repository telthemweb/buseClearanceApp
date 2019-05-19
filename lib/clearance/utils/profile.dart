
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ContactPage(),
    );
  }
}
class ContactPage extends StatefulWidget {
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7EFE2),
       appBar: AppBar(
         leading: Padding(
           padding: const EdgeInsets.all(4.0),
           child: CircleAvatar(
             child: Image(
               width: 25.0,
               height: 25.0,
               
               image:  AssetImage('assets/holder.png'),
             ),
           ),
         ),
         title: Text("My Profile"),
         elevation: 0.1,
         actions: <Widget>[
           
             IconButton(
              icon: Icon(Icons.school),
              onPressed: () {
                print("pressed call");
              },
            ),
           
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {
                print("pop up menu");
              },
            )
         ],
       ),
      //  body: _buildTextfield()
      body: Column(),
    );
  }
}