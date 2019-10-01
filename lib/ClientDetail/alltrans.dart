import 'package:flutter/material.dart';
import './trascation.dart';
import './transactionClass.dart';
class AllTrans extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      
      itemCount: 20,
      itemBuilder: (context, index){
        
        return Trascation(TransactionClass());
      },
      separatorBuilder: (context,index){
        return Divider();
      },
    );
  }
}