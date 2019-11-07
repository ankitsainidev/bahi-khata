import 'package:flutter/material.dart';
import './trascation.dart';
import './transactionClass.dart';
import '../models.dart';
import '../database.dart';

class AllTrans extends StatelessWidget {
  DatabaseClient mydb = DatabaseClient();
  Client client;
  AllTrans(this.client);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Transac>>(
      future: mydb.transactionsOfClient(client.id),
      builder: (BuildContext context, AsyncSnapshot<List<Transac>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView.separated(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return Trascation(snapshot.data[index]);
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
          );
        }
        return ListView.separated(
            itemCount: 0,
            itemBuilder: (context, index) {
              return Text('');
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
          );
      },
    );
  }
}
