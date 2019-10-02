import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUpPage extends StatelessWidget {
  String routeName = '/signUp';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        TextField(
          controller: emailController,
        ),
        TextField(
          controller: passwordController,
        ),
        MaterialButton(
          onPressed: () async {
            try {
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: emailController.text,
                  password: passwordController.text);
            } catch (PlatformException) {
              print('hii');
            }
            await FirebaseAuth.instance.signInWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);
            FirebaseUser user = await FirebaseAuth.instance.currentUser();
            user.sendEmailVerification();
            await FirebaseAuth.instance.signOut();
            Navigator.pushNamed(context, '/login', arguments: true);
          },
        ),
      ],
    ));
  }
}
