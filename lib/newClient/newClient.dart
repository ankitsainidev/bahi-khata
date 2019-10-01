import 'package:flutter/material.dart';
import '../share/appBar.dart';

class NewClient extends StatelessWidget {
  String routeName = '/newClient';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: MyAppBar.getAppBar(),
      body: Text('hello'),
    );
  }
}
