import 'package:flutter/material.dart';
import '../models.dart';
import '../database.dart';
import 'package:quiver/time.dart';

class NewTransForm extends StatefulWidget {
  Client client;
  NewTransForm(this.client);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NewTransState(client);
  }
}

class NewTransState extends State<NewTransForm> {
  Client client;
  NewTransState(this.client);
  final _formkey = GlobalKey<FormState>();
  String amount;
  String remark;
  bool received = true;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
        key: _formkey,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                onChanged: (value) {
                  amount = value;
                },
                decoration: InputDecoration(labelText: 'Amount'),
              ),
              TextFormField(
                onChanged: (value) {
                  remark = value;
                },
                decoration: InputDecoration(labelText: 'Remark (optional)'),
              ),
              ListTile(
                leading: Text('Paid'),
                title: Switch(
                    onChanged: (value) {
                      setState(() {
                        received = value;
                      });
                    },
                    value: received),
                trailing: Text('Received'),
              ),
              MaterialButton(
                child: Icon(Icons.send),
                onPressed: () {
                  if (_formkey.currentState.validate()) {
                    DatabaseClient mydb = DatabaseClient();
                    Transac transaction = Transac(
                      amount: amount,
                      remark: remark,
                      clientId: client.id,
                      time: DateTime.now().hour.toString() +
                          ':' +
                          DateTime.now().minute.toString(),
                      date: DateTime.now().day.toString() +
                          '/' +
                          DateTime.now().month.toString() +
                          '/' +
                          DateTime.now().year.toString(),
                    );
                    print(transaction);
                    mydb.insertTranscation(transaction);
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ));
  }
}
