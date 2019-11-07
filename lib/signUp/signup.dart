import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  String routeName = '/signUp';
  String _email;
  String _password;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('New Account'),
      ),
      body: NewAccount(),
    );
  }
}

class NewAccount extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NewAccountState();
  }
}

class NewAccountState extends State<NewAccount> {
  final _formkey = GlobalKey<FormState>();
  void _createUser(BuildContext context, email, password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email, password: password);
      await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: email, password: password);
              
          FirebaseUser user = await FirebaseAuth.instance.currentUser();
          user.sendEmailVerification();
          await FirebaseAuth.instance.signOut();
          Navigator.pop(context);
          
          Navigator.popAndPushNamed(context, '/login', arguments: true);
    } catch (PlatformException) {
      Navigator.pop(context);
      showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(title: Text(PlatformException.code),);
        }
      );
    }
    
  }

  String _email;
  String _password;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
      key: _formkey,
      child: Column(
        children: <Widget>[
          TextFormField(
            onChanged: (value){
              _email = value;
            },
            validator: (value) {
              if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(value)) {
                return 'Not Valid Email';
              }
              return null;
            },
            decoration: InputDecoration(labelText: 'Email'),
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Fill in Password';
              }
              return null;
            },
            onChanged: (value) {
              _password = value;
            },
            autocorrect: false,
            obscureText: true,
            decoration: InputDecoration(labelText: 'Password'),
          ),
          TextFormField(
            validator: (value) {
              if (value != _password) {
                return 'Password do not match';
              }
              return null;
            },
            autocorrect: false,
            obscureText: true,
            decoration: InputDecoration(labelText: 'Confirm Password'),
          ),
          MaterialButton(
            child: Text("Create Account"),
            onPressed: () {
              
              if (_formkey.currentState.validate()) {
                showDialog(
                  context: context,
                  builder: (BuildContext context){
                    return Center(child: CircularProgressIndicator(),);
                  }
                );
              
              _createUser(context, _email, _password);
              }
            },
          )
        ],
      ),
    );
  }
}

// class SignUpPage extends StatelessWidget {
//   String routeName = '/signUp';
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Card(
//             child: Column(
//       children: <Widget>[
//         TextField(
//             controller: emailController,
//             scrollPadding: EdgeInsets.all(20),
//             decoration: InputDecoration(
//               filled: true,
//               labelText: 'Email',
//             )),
//         TextField(
//           controller: passwordController,
//           scrollPadding: EdgeInsets.all(20),
//           decoration: InputDecoration(
//             filled: true,
//             labelText: 'Password',
//           ),
//         ),
//         MaterialButton(
//           onPressed: () async {
//             try {
//               await FirebaseAuth.instance.createUserWithEmailAndPassword(
//                   email: emailController.text,
//                   password: passwordController.text);
//             } catch (PlatformException) {
//               print('hii');
//             }
//             await FirebaseAuth.instance.signInWithEmailAndPassword(
//                 email: emailController.text, password: passwordController.text);
//             FirebaseUser user = await FirebaseAuth.instance.currentUser();
//             user.sendEmailVerification();
//             await FirebaseAuth.instance.signOut();
//             Navigator.pushNamed(context, '/login', arguments: true);
//           },
//         ),
//       ],
//     )));
//   }
// }
