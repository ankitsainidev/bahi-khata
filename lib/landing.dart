import 'package:flutter/material.dart';
import './main.dart';
void wait(int sec, BuildContext context) async {
  await Future.delayed(Duration(seconds: sec));
  
  Navigator.pushReplacementNamed(context, authenticated?'/home':'/login');
  
}

class LandingPage extends StatelessWidget {
  String routeName = '/';
  @override
  Widget build(BuildContext context) {
    wait(3, context);
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: Center(
        child: Container(
          height: 150,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(color: Colors.cyan[200]),
                child: Icon(
                  Icons.account_balance_wallet,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              Spacer(),
              Center(child: CircularProgressIndicator()),
            ],
          ),
        ),
      ),
    );
  }
}
