import 'package:flutter/material.dart';
import 'package:slop/CallsScreen.dart';
import 'package:slop/Camerascreen.dart';
import 'package:slop/ChatListScreen.dart';
import 'package:slop/Chatscreen.dart';
import 'package:slop/StatusScreen.dart';
class WhatsAppHome extends StatefulWidget{
  WhatsAppHomeState createState(){
    new WhatsAppHomeState();
  }
}
class WhatsAppHomeState extends State<WhatsAppHome> with SingleTickerProviderStateMixin{
  TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController=new TabController(
        length: 4,
        vsync: this,
        initialIndex: 1);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title:new Text("WhatsApp") ,
        elevation: 0.7,
        bottom: new TabBar(
          controller: tabController,
            indicatorColor: Colors.white,
            tabs: <Widget>[
              new Tab(icon: new Icon(Icons.camera_alt),
              ),
              new Tab(text:"CALLS"),
              new Tab(text: "CHATS"),
              new Tab(text: "STATUS"),
            ],
           ),
        actions: <Widget>[
          new Icon(Icons.search),
          new Padding(padding: const EdgeInsets.symmetric(horizontal: 5.0)),
          new Icon(Icons.more_vert),
        ],

      ),
      body: new TabBarView(
        controller: tabController,
          children: <Widget>[
            new CameraScreen(),
            new ChatlistScreen(),
            new StatusScreen(),
            new CallsScreen(),
          ],
      ),
      floatingActionButton: new FloatingActionButton(
          backgroundColor: Theme.of(context).accentColor,
          child: new Icon(Icons.message,color: Colors.white,),
          onPressed:(){
            new chatScreen();
          }),
    );
  }


}