import 'package:flutter/material.dart';
import '../share/appBar.dart';
import './contactCard.dart';
import '../share/contactInfo.dart';

class ClientList extends StatelessWidget {
  List<String> contacts = ['ankit', 'name'];
  List<String> another = ['ank', 'john', 'hello'];

  final String routeName = '/clientList';
  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < 100; i++) {
      contacts.addAll(another);
    }
    return Scaffold(
      appBar: MyAppBar.getAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, '/ClientDetail');
        },
        child: Icon(Icons.person_add),
      ),
      body: ListView.builder(
        itemCount: 300,
        itemBuilder: (ctxt, index) =>
            ContactCard(ContactInfo(this.contacts[index])),
      ),
    );
  }
}
