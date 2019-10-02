import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './home/home.dart';
import './newClient/newClient.dart';
import './clientList/clientList.dart';
import './ClientDetail/ClientDetail.dart';
import './loginUI.dart/login.dart';
import './landing.dart';
import './signUp/signup.dart';
void main()=> runApp(MyApp());
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LandingPage().routeName,
      routes: {
        // TryList().routeName: (context) =>TryList(),
        SignUpPage().routeName: (context) => SignUpPage(),
        LandingPage().routeName: (context) => LandingPage(),
        Home().routeName: (context) => Home(),
        ClientList().routeName: (context) => ClientList(),
        ClientDetail().routeName: (context) => ClientDetail(),
        NewClient().routeName: (context) => NewClient(),
        Login().routeName: (context) => Login(),
      }

    );
  }
}                                                                                                                                                                                                                                                                                                                                                                                                           