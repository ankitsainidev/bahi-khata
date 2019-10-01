import 'package:flutter/material.dart';
import './home/home.dart';
import './newClient/newClient.dart';
import './clientList/clientList.dart';
import './ClientDetail/ClientDetail.dart';
import './listtry.dart';
import './loginUI.dart/login.dart';
void main()=> runApp(MyApp());
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Home().routeName,
      routes: {
        // TryList().routeName: (context) =>TryList(),
        Home().routeName: (context) => Home(),
        ClientList().routeName: (context) => ClientList(),
        ClientDetail().routeName: (context) => ClientDetail(),
        NewClient().routeName: (context) => NewClient(),
        Login().routeName: (context) => Login(),
      }

    );
  }
}