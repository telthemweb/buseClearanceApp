import 'package:buseclear/clearance/utils/chat_message.dart';
import 'package:flutter/material.dart';

class ExamPower extends StatelessWidget {
  const ExamPower({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Examination Panel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ExamDashboard(),
    );
  }
}
class ExamDashboard extends StatefulWidget {
  final List data;
  ExamDashboard({this.data});
  _ExamDashboardState createState() => _ExamDashboardState();
}

class _ExamDashboardState extends State<ExamDashboard> {
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
            makeDashboardItem("Transcript", Icons.school,context),
            makeDashboardItem("Certificate", Icons.school,context),
            makeDashboardItem("Reports", Icons.receipt,context),
            makeDashboardItem("Messaging", Icons.message,context),
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
          onTap: ()=>{},
        ),
      ],
    );
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
  if (name == "Transcript") {

    print("Clicked");
      //  Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => Clearance()));

    }
    else if (name == "Certificate"){
      print("Certificate");
      //  Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => Profile()));
    }
    else if (name == "Reports"){
      print("Reports");
      //  Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => Profile()));
    }
    else if (name == "Messaging"){
       Navigator.push(
          context, MaterialPageRoute(builder: (context) => ChatMessage()));
    }
    
 
}



}