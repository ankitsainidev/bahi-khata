import 'dart:convert';
import 'package:password/password.dart';
class Client{
  Client();
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
    Map map{
      ''
    }
  }
}
class Transac{

}