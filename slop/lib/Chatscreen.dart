import 'package:flutter/material.dart';
import 'package:path/path.dart';
final String defaultName="Muhammad";
class chatScreen extends StatefulWidget{
  chatScreenState createState(){
    new chatScreenState();
  }
}
class chatScreenState extends State<chatScreen> with TickerProviderStateMixin{
  final List<Msg> messages=<Msg> [];
  final TextEditingController _textController=new TextEditingController();
  bool isWriting=false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title:new Text("WhatsApp") ,
        elevation: 0.7,
      ),
      body: new Column(children: <Widget>[
        new Flexible(
          child: new ListView.builder(
            itemBuilder: (_,int index){
              messages[index];
            },
            itemCount: messages.length,
            reverse: true,
            padding: new EdgeInsets.all(6.0),

              ),
        ),
        new Divider(
          height: 1.0,
        ),
        new Container(
          child: buildComposer(),
          decoration: new BoxDecoration(color: Theme.of(context).cardColor),
        )
      ],

      ),

    );

  }
  Widget buildComposer(){
    return new IconTheme(
        data: new IconThemeData(color: Colors.blue),
        child: new Container(
          margin: const EdgeInsets.symmetric(horizontal: 9.0),
          child: new Row(
            children: <Widget>[
              new Flexible(child: new TextField(
                controller: _textController,
                onChanged: (String txt){
                  setState(() {
                    isWriting=txt.length>0;
                  });
                },
                onSubmitted: submitMsg,
                decoration:
                new InputDecoration.collapsed(hintText: "Enter Some Text to send a message"),
              ),
              ),
              new Container(
                margin: new EdgeInsets.symmetric(horizontal: 3.0),
                child: new IconButton(
                  icon: new Icon(Icons.message),

                  onPressed: isWriting?(){
                    submitMsg(_textController.text);
                  }:null,
                ),
              )
            ],
          ),


        )
    );
  }
  void submitMsg(String txt){
    _textController.clear();
    setState(() {
      isWriting=false;
    });
    Msg msg=new Msg(
      txt: txt,
      animationController: new AnimationController(
          vsync: this,
      duration: new Duration(milliseconds: 800)
      ),

    );
    setState(() {
      messages.insert(0, msg);
    });
    msg.animationController.forward();

    }
  @override
  void dispose(){
    for(Msg msg in messages){
      msg.animationController.dispose();
    }
    super.dispose();
  }
}

class Msg extends StatelessWidget{
  Msg({this.animationController,this.txt});
  final String txt;
  final AnimationController animationController;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new SizeTransition(
        sizeFactor: new CurvedAnimation(
            parent: animationController,
            curve: Curves.bounceOut),
      axisAlignment: 0.0,
      child: new Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(right: 18.0),
              child: new CircleAvatar(child: new Text(defaultName)),
            ),
            new Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(defaultName,style: Theme.of(context).textTheme.subhead),
                  new Container(margin: const EdgeInsets.only(top: 6.0),
                  child: new Text(txt),
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