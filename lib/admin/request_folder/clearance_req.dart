import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AdminClear extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ClearanceReq(),
    );
  }
}
class ClearanceReq extends StatefulWidget {
    // final index;
    // ClearanceReq({Key key, this.index});
  _ClearanceReqState createState() => _ClearanceReqState();
}

class _ClearanceReqState extends State<ClearanceReq> {
  Future<List> getData() async{
    var url = 'http://buseclearance.000webhostapp.com/fetchAllCleared.php';
    http.Response response = await http.get(url);
    return jsonDecode(response.body);
  }

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color(0xffF7EFE2),
       appBar: AppBar(
         title: Text("Bursary Panel"),
         elevation: 0.1,
         actions: <Widget>[
            IconButton(
              icon: Icon(Icons.message),
              onPressed: () {
                print("pressed Message");
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
  clearStudent(int i) async{
    var url = 'http://buseclearance.000webhostapp.com/accept.php';
    http.Response response = await http.post(url,body: {
      "id":list[0][i],
    });
    return jsonDecode(response.body);
  }
    @override
    Widget build(BuildContext context) {
      return ListView.builder(
        itemCount: list ==null ? 0 : list.length,
        itemBuilder: (BuildContext context, int i) {
          return Container(
            padding: EdgeInsets.all(10.0),
            child:  ListTile(
            title: Text(list[i]['name'] +" "+ list[i]['surname']),
              trailing: FlatButton(               
              onPressed: (){
                clearStudent(i);
               final snack = SnackBar(
                 content: Text(list[i]['name'] +" "+ list[i]['surname'] +" Cleared successfully" ),
                 backgroundColor: Colors.green,
                );
                Scaffold.of(context).showSnackBar(snack);         
              },
          color: Colors.greenAccent,
          splashColor: Color(0xff34B7F1),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Text("Accept",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold)),
            ),
            subtitle: Text(list[i]['programme']),
          ), 
          );
        },
      );
    }
}