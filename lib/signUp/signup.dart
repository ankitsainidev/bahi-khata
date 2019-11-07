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
        backgroundColor: Colors.teal[600],
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
          Padding(
            padding:EdgeInsets.symmetric(vertical: 10,horizontal: 5),
            child:
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
            decoration: mydecoration('Email',Colors.teal[600]),
          )),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
            child:
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
            decoration: mydecoration('password', Colors.teal[600]),
          ),),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
            child:
          TextFormField(
            validator: (value) {
              if (value != _password) {
                return 'Password do not match';
              }
              return null;
            },
            autocorrect: false,
            obscureText: true,
            decoration: mydecoration('Confirm Password',Colors.teal[600]),
          )),
          RaisedButton(
            color: Colors.teal[100],
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

InputDecoration mydecoration(label,color){
  return InputDecoration(labelText: label,
  labelStyle: TextStyle(color: Colors.black),
  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: color)),
  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: color)),
  border: OutlineInputBorder(borderSide: BorderSide(color: color)));
}