import 'package:flutter/material.dart';
import '../share/appBar.dart';
import '../share/contactInfo.dart';
import './text.dart';
import './alltrans.dart';
import 'dart:async';
import '../models.dart';
import '../database.dart';
import 'package:url_launcher/url_launcher.dart';
import 'newtransform.dart';

//random comment
//ano
class ClientDetail extends StatelessWidget {
  String routeName = '/ClientDetail';
  Client client;
  @override
  Widget build(BuildContext context) {
    Client client = ModalRoute.of(context).settings.arguments;

    // this.transaction = info.getAmount();

    return Scaffold(
        appBar: MyAppBar.getAppBar(context, widgets: [
          MaterialButton(
              child: Icon(Icons.add_box),
              onPressed: () async {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Center(
                        child: Wrap(
                            // constraints: BoxConstraints.tightFor(),
                            children: [
                          Card(
                            child: NewTransForm(client),
                          )
                        ]));
                  },
                );
              })
        ]),
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
                          MyText('Name',
                              client.name != null ? client.name : 'not a name'),
                          MyText('Contact', client.mobile.toString()),
                          FutureBuilder<int>(
                            future: client.getAmount(),
                            builder: (BuildContext context,
                                AsyncSnapshot<int> snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                return MyText(
                                    'Amount', snapshot.data.toString());
                              }
                              return Text('...');
                            },
                          ),

                          // MyText('payable','');
                        ],
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: GestureDetector(
                              child: Icon(Icons.call),
                              onTap: () {
                                launch("tel:" + client.mobile);
                              }),
                        ),
                        GestureDetector(
                          child: Icon(Icons.message),
                          onTap: () {
                            launch("sms:${client.mobile}");
                          },
                        ),
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
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(blurRadius: 10, color: Colors.blueGrey[100])
                    ],
                  ),
                  margin: EdgeInsets.all(10),
                  child: Card(
                    elevation: 0,
                    child: AllTrans(client),
                  )))
        ]));
  }
}
