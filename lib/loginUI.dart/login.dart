import 'package:flutter/material.dart';
import '../share/appBar.dart';
class Login extends StatelessWidget{
  String routeName ='/login';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: MyAppBar.getAppBar(),
      body: Text('hyy'),
      );
  }
}