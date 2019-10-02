import 'package:flutter/material.dart';
import '../share/appBar.dart';
import '../share/contactInfo.dart';
import './text.dart';
import './alltrans.dart';
import 'dart:async';

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
    
    return Scaffold(
        appBar: MyAppBar.getAppBar(),
        body: Column(children: [
          Container(
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
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          MyText('Name', this.name),
                          MyText('Contact', this.number),
                          MyText('Amount', this.transaction.toString()),
                        ],
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.all(20),
                            child: Icon(Icons.call)),
                        Icon(Icons.message),
                      ],
                    )
                  ],
                ),
              ),
              
            ),
          ),
          Text(
            'Transactions',
            style: TextStyle(fontWeight: FontWeight.w200, fontSize: 20),
          ),
          Expanded(
              child: Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(blurRadius: 10, color: Colors.blueGrey[100])
                  ]),
                  margin: EdgeInsets.all(10),
                  child: Card(
                    elevation: 0,
                    child: AllTrans(),
                  )))
        ]));
  }
}
