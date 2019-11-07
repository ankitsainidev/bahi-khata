import 'package:flutter/material.dart';
import '../share/contactInfo.dart';
import '../models.dart';
import 'dart:math';
class ContactCard extends StatelessWidget {
  Client client;
  ContactCard(this.client);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.pushNamed(context, '/ClientDetail', arguments: this.client);
      },
      child: Row(
        children: <Widget>[
          Icon(Icons.person),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(client.name == null ? 'not a name' : client.name),
                    Text(client.mobile.toString()),
                  ]),
            ),
          ),
          FutureBuilder<int>(
            future: client.getAmount(),
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              if(snapshot.connectionState == ConnectionState.done){
                return Text((snapshot.data).toString(),style: TextStyle(color: snapshot.data>=0?Colors.green:Colors.red,),);
              }
              // switch (snapshot.connectionState) {
              //   case ConnectionState.none:
              //     return Text('Press button to start.');
              //   case ConnectionState.active:
              //   case ConnectionState.waiting:
              //     return Text('Awaiting result...');
              //   case ConnectionState.done:
              //     if(snapshot.hasError) return Text(snapshot.error.toString());
              //     return Text(snapshot.data.toString());

              // }
              return Text('');
            },
          ),
        ],
      ),
    );
  }
}
