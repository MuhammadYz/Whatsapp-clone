import 'package:flutter/material.dart';
import 'package:slop/ChatModel.dart';
class ChatlistScreen extends StatefulWidget{

  @override
  ChatlistScreenState createState(){
    new ChatlistScreenState();
  }
}
class ChatlistScreenState extends State<ChatlistScreen>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: dummydata.length,
        itemBuilder: (context,i)=> new Column(
          children: <Widget>[
            new Divider(
              height: 10.0,
            ),
            new ListTile(
              leading: new CircleAvatar(
                foregroundColor: Theme.of(context).primaryColor,
                backgroundColor: Colors.grey,
              ),
              title: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(dummydata[i].name,
                style: new TextStyle(fontWeight: FontWeight.bold)
                ),
             new Text(dummydata[i].time,
               style: new TextStyle(color: Colors.grey,fontSize: 14.0),)
              ],
              ),
              subtitle: new Container(
                padding: const EdgeInsets.only(top: 5.0),
                child: new Text(dummydata[i].message,
                style: new TextStyle(color: Colors.grey,fontSize: 15.0),),
              ),
            )
          ],
        ));
  }
}