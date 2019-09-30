import 'package:flutter/material.dart';
class MyAppBar{
  
  static getAppBar(){
    return AppBar(
      title: Text('Data'),
      backgroundColor: Colors.lightBlueAccent[600],
      actions: <Widget>[
        Icon(Icons.account_balance),
      ],
    );
  }
}



