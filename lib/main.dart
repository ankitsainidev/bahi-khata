import 'package:flutter/material.dart';
import './home/home.dart';

import './clientList/clientList.dart';
void main()=> runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    //my first contribution
    //first contribution from other laptop
    return MaterialApp(
      initialRoute: Home().routeName,
      routes: {
        Home().routeName: (context) => Home(),
        ClientList().routeName: (context) => ClientList(),
        // ClientDetail().routeName: (context) => ClientDetail(),
        // NewClient().routeName: (context) => NewClient(),
      }
      
    );
  }
}