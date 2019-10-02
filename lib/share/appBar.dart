import 'package:flutter/material.dart';
class MyAppBar{
  
  static getAppBar(BuildContext context){
    return AppBar(
      title: Text('Data'),
      backgroundColor: Colors.lightBlueAccent[600],
      actions: <Widget>[
        MaterialButton(child: Icon(Icons.exit_to_app),onPressed: (){Navigator.pushReplacementNamed(context, '/login');},),
      ],
    );
  }
}



