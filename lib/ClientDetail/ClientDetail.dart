import 'package:flutter/material.dart';
import '../share/appBar.dart';
import '../share/contactInfo.dart';
//random comment
//ano
class ClientDetail extends StatelessWidget{
  String routeName='/ClientDetail';
  String name;
  String number;
  double transaction;
  @override
  Widget build(BuildContext context) {
    ContactInfo info = ModalRoute.of(context).settings.arguments;
    this.name = info.name;
    this.number = info.contact;
    this.transaction = info.transaction;
    // TODO: implement build
    return Scaffold(
      appBar: MyAppBar.getAppBar(),
      body: Container(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[Text(this.name),Text(this.number),Text(this.transaction.toString())],
      ),
      )
    );
  }
}