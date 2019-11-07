import 'package:flutter/material.dart';
import './transactionClass.dart';
import './alltrans.dart';
import '../models.dart';
import '../database.dart';
class Trascation extends StatelessWidget {
  Transac data;
  Trascation(this.data);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(data.date),
                  Text(data.time),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                Text(data.amount),
                Text(int.parse(data.amount)>0?'Paid':'Received'),
              ],
            )
          ],
        ),
      ),
      behavior: HitTestBehavior.translucent,
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Center(
              child: Card(
                  child: Container(
                    width: 10000,
                    height: 130,
                      child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    '${data.remark}',
                    
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  MaterialButton(onPressed: (){
                    DatabaseClient mydb = DatabaseClient();
                    print(data);
                    mydb.deleteTransaction(data);
                    Navigator.pop(context);
                  },child: Text('remove this transaction',style: TextStyle(color: Colors.white),),color: Colors.red,),
                ],
              ))),
            );
          },
        );
      },
    );
  }
}
