import 'package:flutter/material.dart';
import '../share/appBar.dart';
import './contactCard.dart';
import '../share/contactInfo.dart';
import '../models.dart';
import '../database.dart';

class ClientList extends StatelessWidget {
  DatabaseClient mydb = DatabaseClient();

  final String routeName = '/clientList';
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Client>>(
      future: mydb.clients(filter: ModalRoute.of(context).settings.arguments!=null?ModalRoute.of(context).settings.arguments:0),
      builder: (BuildContext context, AsyncSnapshot<List<Client>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Text('Press button to start.');
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Scaffold();
          case ConnectionState.done:
            if (snapshot.hasError) return Text('Error: ${snapshot.error}');
            var clients = snapshot.data;
            return Scaffold(
              appBar: MyAppBar.getAppBar(context),
              floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.teal[300],
                onPressed: () {
                  Navigator.pushNamed(context, '/newClient');
                },
                child: Icon(Icons.person_add),
              ),
              body: ListView.separated(
                itemCount: clients.length,
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Colors.grey[400],
                  );
                },
                itemBuilder: (ctxt, index) {
                  print(index);
                  return ContactCard(clients[index]);
                },
              ),
            );
        }
        return Text('...'); // unreachable
      },
    );
  }
}
