import 'package:flutter/material.dart';
import './transactionClass.dart';
import './alltrans.dart';
class Trascation extends StatelessWidget{
  TransactionClass data;
  Trascation(this.data);
  @override
  Widget build(BuildContext context) {

    return  Container(
      padding: EdgeInsets.symmetric(vertical: 6,horizontal: 20),
      child: Row(children: <Widget>[
      Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(data.date),
         Text(data.time),
        ],
      ),),
      Column(
        children: <Widget>[
          Text(data.money.toString()),
          Text(data.action),
        ],
      )
    ],));

    
  }

}
