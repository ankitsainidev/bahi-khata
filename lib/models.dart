import 'dart:convert';
import 'dart:ffi';
import 'package:password/password.dart';
import './database.dart';
class Client {
  final int id;
  final String email;
  final String mobile;
  final String name;


  Client({this.id,this.name, this.email, this.mobile});

  // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Future<int> getAmount() async {
    DatabaseClient dc=DatabaseClient();
    List<Transac> transactions = await dc.transactionsOfClient(id);
    int sum = 0;
    for(int i=0;i<transactions.length;i++){
      sum+= int.parse(transactions[i].amount);
    }
    return sum;
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name':name,
      'email': email,
      'mobile': mobile,
    };
  }
  @override
  String toString() {
    return 'Client(name: $name, id: $id, email: $email, mobile: $mobile,)';
  }
}
class Transac {
  final int id;
  final int clientId;
  final String amount;
  final String time;
  final String date;
  final String remark;
  Transac({this.id,this.clientId,this.amount,this.time,this.date,this.remark});
  Map<String,dynamic> toMap(){
    return {
      'id': id,
      'client_id': clientId,
      'date': date,
      'time': time,
      'amount': amount,
      'remark': remark,

    };
  }
  @override
  String toString() {
    
    return 'Transaction(id: $id, clientId: $clientId, amount: $amount, time: $time, date: $date,remark: $remark)';
  }
}
// Transac j = Transac()
// class Client{
//   int id;
//   int mobile;
//   String email;
//   int totalAmount;
//   String remark;
//   static final columns = ['id','mobile','email','total_amount','remark'];
//   Map<String,dynamic> toMap(){
//     Map<String,dynamic> map = {
//       'mobile': mobile,
//       'email': email,
//       'totalAmount': totalAmount,
//       'remark': remark,

//     };
//     if(id!=null){
//       map['id'] = id;
//     }
//     return map;
//   }
//   static fromMap(Map map){
//     Client client = Client();
//     client.email = map['email'];
//     client.id = map['id'];
//     client.remark = map['remark'];
//     client.totalAmount =map['totalAmout'];
//     client.mobile = map['mobile'];
//     return client;
//   }
// }
// class Transac{
//   int id;
//   int clientId;
//   int amount;
//   String time;
//   String date;
//   static final columns = ['id','clientId','amount','time','date'];
//   Map toMap(){
//     Map map = {
//       'client_id': clientId,
//       'amount': amount,
//       'time': time,
//       'date': date,
//     };
//     if(id!=null){
//       map['id'] = id;
//     }
//     return map;
//   }
//   static fromMap(Map map){
//     Transac transac = Transac();
//     transac.id = map['id'];
//     transac.amount = map['amount'];
//     transac.date = map['date'];
//     transac.time = map['time'];
//     transac.clientId = map['client_id'];
//     return transac;
//   }
// }