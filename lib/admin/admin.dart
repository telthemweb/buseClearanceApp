import 'package:buseclear/admin/request_folder/clearance_req.dart';
import 'package:buseclear/clearance/utils/chat_message.dart';
import 'package:buseclear/users/login.dart';
import 'package:flutter/material.dart';

class Admin extends StatelessWidget {
  final List data;
  int index;
  Admin({@required this.data,this.index});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '${data[0]['department']} Panel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Admindashboard(),
    );
  }
}

class Admindashboard extends StatefulWidget {
    final List data;
    int index;
   Admindashboard({this.data,this.index});
  _AdmindashboardState createState() => _AdmindashboardState();
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
  if (name == "Clearace Request") {
       Navigator.push(
          context, MaterialPageRoute(builder: (context) => ClearanceReq()));

    }
    else if (name == "Messaging"){
       Navigator.push(
          context, MaterialPageRoute(builder: (context) => ChatMessage()));
    }
    else if (name == "Print Report"){
      //  Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => Profile()));
      print("Print Report");
    }
 
}

class _AdmindashboardState extends State<Admindashboard> {
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
        title: Text('${widget.data[0]['department']}  Panel'),
        elevation: 0.1,
        backgroundColor: Color.fromRGBO(49, 87, 110, 1.0),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
        child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(3.0),
          children: <Widget>[
            makeDashboardItem("Clearace Request", Icons.card_travel,context),
            makeDashboardItem("Messaging", Icons.message,context),
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
          accountEmail: new Text(widget.data[0]['department']),
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
