import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../share/appBar.dart';
import '../models.dart';
import '../database.dart';
import 'package:quiver/time.dart';

class NewClient extends StatelessWidget {
  String routeName = '/newClient';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return NewClientForm();
  }
}

class NewClientForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NCState();
  }
}

class NCState extends State<NewClientForm> {
  final formkey = GlobalKey<FormState>();
  String name;
  String number;
  String email;
  String amount;
  String remark;
  bool receivable = true;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
      key: formkey,
      child: Scaffold(
        appBar: MyAppBar.getAppBar(context),
        body: ListView(
          padding: EdgeInsets.all(10),
          children: [
            // TODO: add validators
            TextFormField(
              // scrollPadding: EdgeInsets.all(20),
              onChanged: (value) {
                name = value;
              },
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.teal[600])),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.teal[600])),
                labelStyle: TextStyle(color: Colors.black),
                filled: true,
                labelText: 'Client Name',
              ),
            ),
            TextFormField(
              // scrollPadding: EdgeInsets.all(0),
              keyboardType: TextInputType.phone,
              onChanged: (value) {
                number=value;
              },
              
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.teal[600])),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.teal[600])),
                labelStyle: TextStyle(color: Colors.black),
                filled: true,
                labelText: 'Contact Number',
                
              ),
            ),
            TextFormField(
              // scrollPadding: EdgeInsets.all(20),
              onChanged: (value) {
                email = value;
              },
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.teal[600])),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.teal[600])),
                labelStyle: TextStyle(color: Colors.black),
                filled: true,
                labelText: 'Email(Optional)',
              ),
            ),
            TextFormField(
              // scrollPadding: EdgeInsets.all(20),
              onChanged: (value) {
                amount=value;
              },
              inputFormatters: [
                BlacklistingTextInputFormatter(RegExp("[-+ .,]"))
              ],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.teal[600])),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.teal[600])),
                labelStyle: TextStyle(color: Colors.black),
                filled: true,
                labelText: 'Amount',
              ),
            ),
            ListTile(
              leading: Text("Payable"),
              title: Switch(
                onChanged: (value) {
                  setState(() {
                    receivable = value;
                  });
                },
                value: receivable,
              ),
              trailing: Text('Receivable'),
            ),

            TextFormField(
              // scrollPadding: EdgeInsets.all(0),
              onChanged: (value) {
                remark = value;
              },
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.teal[600])),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.teal[600])),
                labelStyle: TextStyle(color: Colors.black),
                filled: true,
                labelText: 'Remark(Optional)',
              ),
            ),
            Row(
              children: <Widget>[
                Spacer(),
                OutlineButton(
                  padding: EdgeInsets.all(14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  focusColor: Colors.teal[600],
                  
                  highlightedBorderColor: Colors.teal[600],
                  child:
                      Text('Cancel', style: TextStyle(color: Colors.teal[300])),
                  color: Colors.teal[600],
                ),
                Spacer(),
                MaterialButton(
                  height: 45,

                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Colors.teal[300],
                  // textTheme: ButtonTextTheme.,
                  onPressed: () {
                    if (formkey.currentState.validate()) {
                      Client client;
                      Transac transaction;
                      DatabaseClient mydb = DatabaseClient();

                      client = Client(
                          email: email,
                          name: name,
                          mobile: number);
                      print(client);
                      mydb.insertClient(client);
                      mydb.clients().then((value) {
                        for (int i = 0; i < value.length; i++) {
                          if (value[i].mobile == number) {
                            if(!receivable){
                              amount = '-'+amount;
                            }
                            transaction = Transac(
                              amount: amount,
                              clientId: value[i].id,
                              time: DateTime.now().hour.toString() +
                                  ':' +
                                  DateTime.now().minute.toString(),
                              date: DateTime.now().day.toString() +
                                  '/' +
                                  DateTime.now().month.toString() +
                                  '/' +
                                  DateTime.now().year.toString(),
                              remark: remark,
                            );
                            print(transaction);
                            mydb.insertTranscation(transaction);
                            // Scaffold.of(context).showSnackBar(SnackBar(content: Text('${client.name} added'),duration: Duration(seconds: 2),));
                            Navigator.pop(context);
                            break;
                          }
                        }
                      });
                    }
                  },
                  child: Text(
                    'Save',
                    style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
                Spacer(),
              ],
            )
          ].map((widget) {
            return Padding(
              child: widget,
              padding: EdgeInsets.all(10),
            );
          }).toList(),
        ),
      ),
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