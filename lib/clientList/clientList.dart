import 'package:flutter/material.dart';
import '../share/appBar.dart';
import './contactCard.dart';
import '../share/contactInfo.dart';
class ClientList extends StatelessWidget{
  List<String> contacts = ['ankit','name'];
  List<String> another = ['ank','john','hello'];
  
  
  final String routeName='/clientList';
  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < 100; i++) {
      contacts.addAll(another);
    }
    return Scaffold(
      appBar: MyAppBar.getAppBar(),
      body: ListView(

        children: contacts.map((data)=> ContactCard(ContactInfo(data))).toList(),
      ),
    );
  }
}
