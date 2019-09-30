import 'package:flutter/material.dart';
import '../share/contactInfo.dart';

class ContactCard extends StatelessWidget {
  ContactInfo data;
  ContactCard(this.data);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          Icon(Icons.person),
          Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          
            
            child: Column(
              
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(data.name),
              Text(data.contact),
            ]),
          ),),
          Text('by'),
        ],
      ),
    );
  }
}
