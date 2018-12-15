import 'package:flutter/material.dart';
import 'package:slop/WhatsAppHome.dart';

void main(){
  runApp(new MyApp());

}
class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return MaterialApp(
      title: "WhatsApp",
      theme: new ThemeData(
        primaryColor: new Color(0xff075e54),
        accentColor: new Color(0xff250366),
      ),
      debugShowCheckedModeBanner: false,
      home: new WhatsAppHome(),
    );
  }
}