import 'package:flutter/material.dart';

import './cardButton.dart';

import '../share/appBar.dart';
import '../database.dart';

class Home extends StatelessWidget {
  final String routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar.getAppBar(context),
        body: Builder(
          builder: (context) => Column(
            children: <Widget>[
              CardButton('CLIENT', nextRoute: '/clientList'),
              CardButton(
                'PAYABLE',
                nextRoute: '/login',
              ),
              CardButton('REVENUE'),
              MaterialButton(
                onPressed: () async {
                  DatabaseClient mydb = DatabaseClient();
                  // await mydb.create();
                  final clients = await mydb.clients();
                  print(clients);
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text(clients.length.toString()),
                  ));
                },
                child: Text('show message'),
              )
            ],
          ),
        ));
  }
}
