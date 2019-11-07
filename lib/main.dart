import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './home/home.dart';
import './newClient/newClient.dart';
import './clientList/clientList.dart';
import './ClientDetail/ClientDetail.dart';
import './loginUI.dart/login.dart';
import './landing.dart';
import './signUp/signup.dart';
import './loginUI.dart/resetPassword.dart';
import './models.dart';
import './database.dart';

void main() {
  work();
  runApp(MyApp());
}
Future work() async {
  // var client = Client(email: 'il',mobile: 34323,remark: 'sdlf',totalAmount: 23,name: 'ankit');
  DatabaseClient mydb = DatabaseClient();
  await mydb.create();
  print('created Database');
  // await mydb.insertClient(client);
  // print('added');
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LandingPage().routeName,
      routes: {
        // TryList().routeName: (context) =>TryList(),
        ResetPage().routeName: (context) => ResetPage(),
        SignUpPage().routeName: (context) => SignUpPage(),
        LandingPage().routeName: (context) => LandingPage(),
        Home().routeName: (context) => Home(),
        ClientList().routeName: (context) => ClientList(),
        ClientDetail().routeName: (context) => ClientDetail(),
        NewClient().routeName: (context) => NewClient(),
        Login().routeName: (context) => Login(),
      },
    );
  }
}
