import 'package:flutter/material.dart';

import 'package:buseclear/clearance/utils/chat_message.dart';
import 'package:buseclear/clearance/utils/clearance.dart';
import 'package:buseclear/clearance/utils/profile.dart';
import 'package:buseclear/users/login.dart';
class Home extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Panel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatefulWidget {
  final List data;
  _DashboardState createState() => _DashboardState();
   Dashboard({Key key, @required this.data});

}

Card makeDashboardItem(String title, IconData icon,BuildContext context) {
  return Card(
    elevation: 1.0,
    margin: EdgeInsets.all(3.0),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.redAccent
      ),
      child: InkWell(
        onTap: (){
          _onPressed(context, title);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            SizedBox(
                    height: 50.0,
                  ),
                  new Center(
                    child: Icon(
                      icon,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  new Center(
                    child: Text(title,
                        style: TextStyle(color: Colors.white, fontSize: 16.0)),
                  )
          ],
        ),
      ),
    ),
  );
}
  void _onPressed(BuildContext context, String name)  {
  if (name == "Clearace") {
       Navigator.push(
          context, MaterialPageRoute(builder: (context) => Clearance()));

    }
    else if (name == "Messaging"){
       Navigator.push(
          context, MaterialPageRoute(builder: (context) => ChatMessage()));
    }
    else if (name == "My Profile"){
       Navigator.push(
          context, MaterialPageRoute(builder: (context) => Profile()));
    }
 
}

class _DashboardState extends State<Dashboard> {
  void navigationPageLogout() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: buildListView(),
      ),
      appBar: AppBar(
        title: Text("Student Panel"),
        elevation: 0.1,
        backgroundColor: Color.fromRGBO(49, 87, 110, 1.0),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
        child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(3.0),
          children: <Widget>[
            makeDashboardItem("Clearace", Icons.card_travel,context),
            makeDashboardItem("Messaging", Icons.message,context),
            makeDashboardItem("My Profile", Icons.verified_user,context),
            makeDashboardItem("Logout", Icons.check_circle,context),
          ],
        ),
      ),
    );
  }

  ListView buildListView() {
    return new ListView(
      children: <Widget>[
        new UserAccountsDrawerHeader(
          currentAccountPicture: new CircleAvatar(
            backgroundImage: new AssetImage('assets/login.png'),
          ),
          accountName: new Text(widget.data[0]['fullname']),
          accountEmail: new Text(widget.data[0]['programme']),
        ),
        new ListTile(
          title: Text("Home"),
          leading: new Icon(Icons.home),
          onTap: () {},
        ),
        Divider(),
        new ListTile(
          title: Text("Contact Me"),
          leading: new Icon(Icons.email),
          onTap: () {},
        ),
        Divider(),
        new ListTile(
          title: Text("About App"),
          leading: new Icon(Icons.android),
          onTap: () {},
        ),
        Divider(),
        new ListTile(
          title: Text("Rate Us"),
          leading: new Icon(Icons.star),
          onTap: () {},
        ),
        Divider(),
        new ListTile(
          title: Text("More App"),
          leading: new Icon(Icons.menu),
          onTap: () {},
        ),
        Divider(),
        new ListTile(
          title: Text("Logout"),
          leading: new Icon(Icons.exit_to_app),
          onTap: navigationPageLogout,
        ),
      ],
    );
  }
}
