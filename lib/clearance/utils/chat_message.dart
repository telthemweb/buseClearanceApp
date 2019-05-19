import 'package:flutter/material.dart';
const String _name ="Wenselous";


class ChatMessage extends StatelessWidget {
  final String text;
  final String _mydate = 'Suday,11 May';
  ChatMessage({Key key, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
     margin: EdgeInsets.symmetric(vertical: 10.0),
     child: Column(
       children: <Widget>[
         Container(
           padding: EdgeInsets.all(8.0),
           decoration: BoxDecoration(
            color: Color(0xffEBE3D2),
            borderRadius: BorderRadius.all(
               Radius.circular(16.0)
              )
         ),
         child: Text(
           _mydate,
           style: TextStyle(
              color: Color(0xffC0929C),
              fontStyle: FontStyle.italic,
              fontFamily: 'san-serif'// 0BAE5F
            ),
         ),
         ),
         SizedBox(height: 8.0),
         Container(
           child: buildMessageRow(),
         ),
       ],
     ),
    );
  }

  Row buildMessageRow() {
    return Row( 
     crossAxisAlignment: CrossAxisAlignment.start,
     children: <Widget>[
       Container(
         margin: EdgeInsets.only(right: 10.0),
         child: CircleAvatar(
           child: Image(
             width: 25.0,
             height: 25.0,
             image: AssetImage('assets/holder.png'),
           ),
         ),
       ),
       Container( 
         decoration: BoxDecoration(
            color: Color(0xff76BFA2),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              bottomLeft: Radius.circular(16.0),
              bottomRight: Radius.circular(30.0),
              )
         ),
         
         child: Padding(
           padding: const EdgeInsets.only(top:10.0,left: 16.0,right: 16.0,bottom: 12.0),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: <Widget>[
               Text(
                 _name,
                 style: TextStyle(
                     color: Color(0xffC0929C)// 0BAE5F
                   ),            
               ),
               Container(
                 margin: EdgeInsets.only(top: 5.0),
                 child: Text(
                   text,
                   style: TextStyle(
                     color: Color(0xffffffff)// 0BAE5F
                   ),
                 ),
               )
             ],
           ),
         ),
       )
     ],
   );
  }
}
