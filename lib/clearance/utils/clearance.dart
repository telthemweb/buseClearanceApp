
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Clearance extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ClearancePage(),
    );
  }
}
class ClearancePage extends StatefulWidget {
  final List list;
  const ClearancePage({Key key, this.list}) : super(key: key);
  _ClearancePageState createState() => _ClearancePageState();
}

class _ClearancePageState extends State<ClearancePage> {
   Future<List> getData() async{
    var url = 'http://buseclearance.000webhostapp.com/getDepartment.php';
    http.Response response = await http.get(url);
    return jsonDecode(response.body);
    // print(data.toString());
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7EFE2),
       appBar: AppBar(
         title: Text("Clearance Palatte"),
         elevation: 0.1,
         actions: <Widget>[
            IconButton(
              icon: Icon(Icons.message),
              onPressed: () {},
            ),
             
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            )
         ],
       ),
      //  body: _buildTextfield()
      body: FutureBuilder<List>(
        future: getData(),
         builder: (BuildContext context, AsyncSnapshot snapshot) {
           if(snapshot.hasError) print(snapshot.error);
           return snapshot.hasData
           ?  ItemList(
             list: snapshot.data
           )
           : Center(
             child: CircularProgressIndicator(),
           );
         },

      )
    );
  }
 
}
 class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});

   Future<List> clearData() async{
    var url = 'http://buseclearance.000webhostapp.com/clearStudent.php';
    http.post(url,body: {
      'stID':list[0]['stID'],
      'dptID':list[0]['dptID']
    });
    // print(data.toString());
  
  }
    @override
    Widget build(BuildContext context) {
      return ListView.builder(
        itemCount: list ==null ? 0 : list.length,
        itemBuilder: (BuildContext context, int i) {
          return Container(
            padding: EdgeInsets.all(10.0),
            child:  ListTile(
            title: Text(list[i]['name']),
              trailing: FlatButton(
              onPressed: (){
                clearData();
              },
          color: Colors.greenAccent,
          splashColor: Color(0xff34B7F1),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Text("Clear",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold)),
            ),
          ),
          
          );
        },
      );
    }
  }