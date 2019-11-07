import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart' as prefix0;

class MyAppBar {
  static getAppBar(BuildContext context,{List<Widget> widgets=const []}) {
    return AppBar(
      title: Text('E Wallet'),
      backgroundColor: Colors.teal[600],
      actions: <Widget>[
        MaterialButton(
          child: Icon(Icons.exit_to_app),
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            Navigator.of(context).pushNamedAndRemoveUntil(
                '/login', (Route<dynamic> route) => false);
          },
        ),

      ]+widgets,
    );
  }
}
