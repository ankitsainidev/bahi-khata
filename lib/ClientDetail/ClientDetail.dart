import 'package:flutter/material.dart';
import '../share/appBar.dart';
class ClientDetail extends StatelessWidget{
  String routeName='/ClientDetail';
  String name='ankit';
  String number='9838749';
  String transaction='Rs.30';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: MyAppBar.getAppBar(),
      body: Container(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[Text(this.name),Text(this.number),Text(this.transaction)],
      ),
      )
    );
  }
}