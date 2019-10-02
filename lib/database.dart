import 'dart:async';
import 'dart:io';
// import 'package:bahi_khata/models.dart' as prefix0;
// import 'package:bahi_khata/models.dart' as prefix0;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import './models.dart';
import 'models.dart';

class DatabaseClient {
  Database _db;
  Future create() async {
    Directory path = await getApplicationDocumentsDirectory();
    String dbPath = join(path.path, 'database.db');
    _db = await openDatabase(dbPath, version: 1,onCreate: _create);

  }

  Future _create(Database db, int version) async {
    await db.execute("""
                  CREATE TABLE transac (
                  id INTEGER PRIMARY KEY,
                  client_id INTEGER NOT NULL,
                  amount INTEGER NOT NULL,
                  
                  date TEXT NOT NULL,
                  time TEXT NOT NULL,
                  FOREIGN KEY (client_id) REFERENCES client (id)
                    ON DELETE NO ACTION ON UPDATE NO ACTION)""");
    await db.execute("""
    CREATE TABLE client(
      id INTEGER PRIMARY KEY,
      user_id INTEGER NOT NULL,
      mobile INTEGER NOT NULL UNIQUE,
      email TEXT UNIQUE,
      total_amout INTEGER NOT NULL,
      remark TEXT,
      FOREIGN KEY (user_id) REFERENCES user (id)
        ON DELETE NO ACTION ON UPDATE NO ACTION)""");
    await db.execute("""
    CREATE TABLE user(
      id INTEGER PRIMARY KEY,
      name TEXT NOT NULL,
      mobile INTEGER NOT NULL UNIQUE,
      email TEXT UNIQUE,
      password TEXT NOT NULL,
      
      )""");
  }
  Future<User> upsertUser(User user) async{
    var count = Sqflite.firstIntValue(await _db.rawQuery("SELECT COUNT(*) FROM user WHERE mobile = ?",[user.mobile]));
    if(count==0){
      user.id =await _db.insert("user", user.toMap());

    }else{
      await _db.update("user", user.toMap(),where: "id = ?", whereArgs: [user.id]);
    }
    return user;
  }
  Future<Transac> upsertTransaction(Transac transaction) async {
    if(transaction.id !=null){
      await _db.update('transac', transaction.toMap());

    }else{
      transaction.id = await _db.insert("transac", transaction.toMap());
    }
    return transaction;
  }
  Future<Client> upsertClient(Client client) async{
    if(client.id!=null){
      await _db.update('client', client.toMap());
    }else{
      client.id = await _db.insert('client', client.toMap());
    }
    return client;
  }
  Future<List<Client>> fetchClientsOfUser(User user) async{
    List<Map> clients = await _db.query('client',columns: Client.columns,where: "user_id = ?",whereArgs: [user.id],orderBy: "id");
    return clients.map((client)=>Client.fromMap((client)));
  }
  Future<List<Transac>> fetchTransacOfClient(Client client) async{
    List<Map> transacs = await _db.query('transac',columns: Transac.columns,where: "client_id = ?",whereArgs: [client.id]);
    return transacs.map((transac)=>Client.fromMap(transac));
  }
  Future<User> fetchUser(String mobile) async{
    var count = Sqflite.firstIntValue(await _db.rawQuery("SELECT COUNT(*) FROM user WHERE mobile = ?",[mobile]));
    if(count !=0){
    var user = await _db.query('user',columns: User.columns,where: "mobile = ?", whereArgs: [mobile]);
    return User.fromMap(user[0]);}
    else{
      throw new Exception('user not found');
    }
  }
}


