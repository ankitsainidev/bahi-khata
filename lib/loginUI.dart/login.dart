import 'package:flutter/material.dart';
import '../share/appBar.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatelessWidget {
  String routeName = '/login';
  Future<void> _signInAnonymously(
      BuildContext context, String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = await FirebaseAuth.instance.currentUser();
      if (user != null && user.isEmailVerified) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        print('not authorized');
      }
    } catch (e) {
      print(e); // TODO: show dialog with error
    }
  }
  @override
  Widget build(BuildContext context) {
    bool newuser=false;
    if(ModalRoute.of(context).settings.arguments != null){
      newuser=true;
    }
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: MyAppBar.getAppBar(context),
      body: Center(
        child: Column(
          children: [
            newuser?Text('Please go to your email and verify before login.'):Text('Go On'),
            TextField(
              controller: emailController,
            ),
            TextField(
              controller: passwordController,
            ),
            MaterialButton(
              child: Text('Login'),
              onPressed: () {
                _signInAnonymously(
                    context, emailController.text, passwordController.text);
              },
            ),
            MaterialButton(child: Text('signup'),onPressed: (){
              Navigator.pushNamed(context, '/signUp');
            },),
          ],
        ),
      ),
    );
  }
}
