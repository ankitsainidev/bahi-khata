import 'package:flutter/material.dart';

import './cardButton.dart';

import '../share/appBar.dart';
class Home extends StatelessWidget {
  final String routeName='/';
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: MyAppBar.getAppBar(),
      body: Column(
        children: <Widget>[
          CardButton('CLIENT',nextRoute: '/clientList'),
          CardButton('PAYABLE'),
          CardButton('REVENUE'),
        ],
          
        
      ),
    );
}
}