import 'dart:convert';
import 'package:password/password.dart';
class Client{
  int id;
  int userId;
  int mobile;
  String email;
  int totalAmount;
  String remark;
  static final columns = ['id','user_id','mobile','email','total_amount','remark'];
  Map toMap(){
    Map map = {
      'userId': userId,
      'mobile': mobile,
      'email': email,
      'totalAmount': totalAmount,
      'remark': remark,

    };
    if(id!=null){
      map['id'] = id;
    }
    return map;
  }
  static fromMap(Map map){
    Client client = Client();
    client.email = map['email'];
    client.id = map['id'];
    client.remark = map['remark'];
    client.userId = map['userId'];
    client.totalAmount =map['totalAmout'];
    client.mobile = map['mobile'];
    return client;
  }
}
class User{
  int id;
  String name;
  int mobile;
  String email;
  String password;
  static final columns = ['id','name','mobile','email','password'];
  Map toMap(){
    Map map={
      'name': name,
      'mobile': mobile,
      'email': email,
      'password': Password.hash(password, PBKDF2()),
    };
    if(id!=null){
      map['id'] =id;
    }
    return map;
  }
  static fromMap(Map map){
    User user = User();
    user.id = map['id'];
    user.name = map['name'];
    user.mobile = map['mobile'];
    user.email = map['email'];
    user.password = map['password'];
    return user;
  }
}
class Transac{
  int id;
  int clientId;
  int amount;
  String time;
  String date;
  static final columns = ['id','clientId','amount','time','date'];
  Map toMap(){
    Map map = {
      'client_id': clientId,
      'amount': amount,
      'time': time,
      'date': date,
    };
    if(id!=null){
      map['id'] = id;
    }
    return map;
  }
  static fromMap(Map map){
    Transac transac = Transac();
    transac.id = map['id'];
    transac.amount = map['amount'];
    transac.date = map['date'];
    transac.time = map['time'];
    transac.clientId = map['client_id'];
    return transac;
  }
}