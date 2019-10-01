import 'package:flutter/material.dart';
import '../share/appBar.dart';
import '../share/contactInfo.dart';
import './text.dart';

//random comment
//ano
class ClientDetail extends StatelessWidget {
  String routeName = '/ClientDetail';
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
        padding: EdgeInsets.all(0),
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 5,
        color: Colors.transparent,
        margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
        child: Card(
            elevation: 10,
            margin: EdgeInsets.all(0),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MyText('Name', this.name),
                  MyText('Contact', this.number),
                  MyText('Transaction', this.transaction.toString()),
                ],
              ),
            )),
      ),
    );
  }
}
