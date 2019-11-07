import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class ResetPage extends StatelessWidget {
  String routeName = '/resetPassword';
  final _formkey = GlobalKey<FormState>();
  String _email;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.teal[600],
        title: Text('Reset Password'),
      ),
      body: MyResetForm(),
    );
  }
}

class MyResetForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ResetState();
  }
}

class ResetState extends State<MyResetForm> {
  final _formkey = GlobalKey<FormState>();
  String _email;
  void _sendresetlink(BuildContext context, String email) async{
    try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    Navigator.pop(context);
    Navigator.pop(context);
    }
    catch(e){
      Navigator.pop(context);
      showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(title: Text('Email is not registered'),);
        }
      );

    }

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
      child: Column(
        children: <Widget>[
          Padding(
            padding:EdgeInsets.symmetric(vertical: 10,horizontal: 5),
            child:
          TextFormField(
            validator: (value) {
              if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(value)) {
                return 'Not Valid Email';
              }
              return null;
            },
            onChanged: (value) {
              _email = value;
            },
            decoration: mydecoration('Email',Colors.teal[600]),
          )),
          RaisedButton(
            color: Colors.teal[100],
            onPressed: () {
              if (_formkey.currentState.validate()) {
                showDialog(
                  context: context,
                  builder: (BuildContext context){
                    return Center(child: CircularProgressIndicator());
                  }
                );
                _sendresetlink(context, _email);
              }
            },
            child: Text('Reset Password'),
          )
        ],
      ),
      key: _formkey,
    );
  }
}



InputDecoration mydecoration(label,color){
  return InputDecoration(labelText: label,
  labelStyle: TextStyle(color: Colors.black),
  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: color)),
  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: color)),
  border: OutlineInputBorder(borderSide: BorderSide(color: color)));
}