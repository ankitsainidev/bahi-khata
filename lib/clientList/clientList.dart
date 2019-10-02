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
      appBar: MyAppBar.getAppBar(context),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, '/newClient');
        },
        child: Icon(Icons.person_add),
      ),
      body: ListView.separated(
        itemCount: 1000,
        separatorBuilder: (context, index){
          return Divider(color: Colors.grey[400],);
        },

        
        itemBuilder: (ctxt, index){
          print(index);
            return ContactCard(ContactInfo('idex'+index.toString()));},
      ),
      
    );
  }
}
