import 'package:flutter/material.dart';
import '../share/appBar.dart';
import 'package:firebase_auth/firebase_auth.dart';

// class Login extends StatefulWidget {
//   String routeName = '/login';

//   @override
//   LoginState createState() {
//     return LoginState();
//   }
// }

// class LoginState extends State<Login> {
//   final _formKey = GlobalKey<FormState>();
//   Future<void> _signInAnonymously(
//     BuildContext context,
//     String email,
//     String password,
//   ) async {
//     try {
//       await FirebaseAuth.instance
//           .signInWithEmailAndPassword(email: email, password: password);
//       FirebaseUser user = await FirebaseAuth.instance.currentUser();
//       Navigator.pop(context);
//       if (user != null && user.isEmailVerified) {
//         Navigator.pushReplacementNamed(context, '/home');
//       } else {
//         print('not authorized');
//       }
//     } catch (e) {
//       Navigator.pop(context);
//       showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               content: Text(e.code),
//             );
//           });
//       print(e); // TODO: show dialog with error
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     bool newuser = false;
//     if (ModalRoute.of(context).settings.arguments != null) {
//       newuser = true;
//     }
//     // TODO: implement build
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("LOG IN"),
//       ),

//       body: Column(
//         children: <Widget>[
//           Text(newuser ? 'Check your email and verify before log in' : ''),
//           Form(
//             child: Text('hello'),

//           ),
//           Row(children: <Widget>[
//             MaterialButton(
//               onPressed: null,
//               child: Text('signup'),
//             ),
//             MaterialButton(
//               onPressed: null,
//               child: Text('reset Password'),
//             ),
//           ]),
//         ],
//       ),
//     );
//   }
// }

// class Login2 extends StatelessWidget {
//   String routeName = '/login';
//   Future<void> _signInAnonymously(
//     BuildContext context,
//     String email,
//     String password,
//   ) async {
//     try {
//       await FirebaseAuth.instance
//           .signInWithEmailAndPassword(email: email, password: password);
//       FirebaseUser user = await FirebaseAuth.instance.currentUser();
//       Navigator.pop(context);
//       if (user != null && user.isEmailVerified) {
//         Navigator.pushReplacementNamed(context, '/home');
//       } else {
//         print('not authorized');
//       }
//     } catch (e) {
//       Navigator.pop(context);
//       showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               content: Text(e.code),
//             );
//           });
//       print(e); // TODO: show dialog with error
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     bool newuser = false;
//     if (ModalRoute.of(context).settings.arguments != null) {
//       newuser = true;
//     }
//     TextEditingController emailController = TextEditingController();
//     TextEditingController passwordController = TextEditingController();
//     return Scaffold(
//       appBar: MyAppBar.getAppBar(context),
//       body: Center(
//         child: Column(
//           children: [
//             newuser
//                 ? Text('Please go to your email and verify before login.')
//                 : Text(''),
//             TextField(
//               controller: emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//             ),
//             TextField(
//               obscureText: true,
//               controller: passwordController,
//               // scrollPadding: EdgeInsets.all(0),

//               decoration: InputDecoration(
//                 filled: true,
//                 labelText: 'Password',
//               ),
//             ),
//             MaterialButton(
//               child: Text('Login'),
//               onPressed: () {
//                 showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return Center(child: CircularProgressIndicator());
//                   },
//                 );
//                 _signInAnonymously(
//                     context, emailController.text, passwordController.text);
//               },
//             ),
//             MaterialButton(
//               child: Text('signup'),
//               onPressed: () {
//                 Navigator.pushNamed(context, '/signUp');
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
class Login extends StatelessWidget {
  String routeName = '/login';
  @override
  Widget build(BuildContext context) {
    bool newuser = false;
    if (ModalRoute.of(context).settings.arguments != null) {
      newuser = true;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Bahi Khata'),
        backgroundColor: Colors.teal[600],
      ),
      body: Column(
        children: <Widget>[
          Text(newuser ? 'Verify email first by checking your inbox' : ''),
          MyCustomLogin(),
          ListTile(

            leading:
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signUp');
                },
                child: Text('Create New Account'),
              ),
              trailing: RaisedButton(
                
                onPressed: () {
                  Navigator.pushNamed(context, '/resetPassword');
                },
                child: Text('Forgot Password'),
              )
            
          )
        ],
      ),
    );
  }
}

class MyCustomLogin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<MyCustomLogin> {
  final _formkey = GlobalKey<FormState>();
  String _email;
  String _password;
  Future<void> _signInAnonymously(
    BuildContext context,
    String email,
    String password,
  ) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = await FirebaseAuth.instance.currentUser();
      Navigator.pop(context);
      if (user != null && user.isEmailVerified) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        print('not authorized');
      }
    } catch (e) {
      print(e);
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text(e.code),
            );
          });
      print(e); // TODO: show dialog with error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Card(
            child: Form(
          key: _formkey,
          child: Column(
            
            children: <Widget>[
              TextFormField(
                validator: (value) {
                  if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value)) {
                    return 'Enter Valid Email';
                  }
                  print('valid');
                  return null;
                },
                // onEditingComplete: ,
                // autovalidate: true,
                onChanged: (value) {
                  _email = value;
                  // print(_email);
                },
                decoration: InputDecoration(
                  hoverColor: Colors.black,
                  focusColor: Colors.black,
                    // filled: true,
                    labelText: "Email",
                    labelStyle: TextStyle(color: Colors.black),
                    
                    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),),
              ),
              
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
                autocorrect: false,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Password can\'t be empty';
                  }
                  return null;
                },
                obscureText: true,
                onChanged: (value) {
                  _password = value;
                },
                
                
                decoration: InputDecoration(
                  hoverColor: Colors.black,
                  focusColor: Colors.black,
                    // filled: true,
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.black),
                    
                    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),)
                    // focusedBorder: UnderlineInputBorder(
                    //     borderSide: BorderSide(
                    //         color: Colors.teal, style: BorderStyle.solid))),
              ),),
              MaterialButton(
                color: Colors.teal[100],
                onPressed: () {
                  if (_formkey.currentState.validate()) {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return Center(child: CircularProgressIndicator());
                      },
                    );
                    _signInAnonymously(context, _email, _password);
                  }
                },
                child: Text('Log In'),
              )
            ],
          ),
        )));
  }
}
