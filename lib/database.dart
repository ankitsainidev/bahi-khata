import 'dart:async';
import 'dart:io';
// import 'package:bahi_khata/models.dart' as prefix0;
// import 'package:bahi_khata/models.dart' as prefix0;
import 'package:bahi_khata/ClientDetail/trascation.dart';
// import 'package:bahi_khata/models.dart' as prefix0;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
// import './models.dart';
// import 'models.dart';
import './models.dart';

class DatabaseClient {
  static var _db;
  Future create() async {
    Directory path = await getApplicationDocumentsDirectory();
    String dbPath = join(path.path, 'database.db');
    _db = await openDatabase(dbPath, version: 1, onCreate: _create);
    print('created db');
  }

  Future _create(Database db, int version) async {
    print('creating tables');
    await db.execute("""
                  CREATE TABLE transac (
                  id INTEGER PRIMARY KEY,
                  client_id INTEGER NOT NULL,
                  remark TEXT,
                  amount TEXT NOT NULL,
                  date TEXT NOT NULL,
                  time TEXT NOT NULL,
                  FOREIGN KEY (client_id) REFERENCES client (id)
                    ON DELETE CASCADE ON UPDATE NO ACTION)""");
    return db.execute("""
    CREATE TABLE client(
      id INTEGER PRIMARY KEY,
      name TEXT NOT NULL,
      mobile TEXT NOT NULL UNIQUE,
      email TEXT UNIQUE)""");
  }
  Future<List<Transac>> transactionsOfClient(int clientId) async {
    List<Map<String,dynamic>> maps = await _db.query('transac',where: "client_id = ?",whereArgs: [clientId],orderBy: '-id');
    return List.generate(maps.length, (i){
      
      return Transac(
        id: maps[i]['id'],
        clientId: maps[i]['client_id'],
        amount: maps[i]['amount'],
        date: maps[i]['date'],
        time: maps[i]['time'],
        remark: maps[i]['remark'],
      );
    });
  }
  Future<void> insertTranscation(Transac trans) async{
    // final Database mydb = _db;
    await _db.insert('transac',trans.toMap(),conflictAlgorithm: ConflictAlgorithm.replace);
  }
  Future<dynamic> runSql(String query)async{
    return _db.execute(query);
  }
  Future<void> deleteTransaction(Transac trans) async{
    final Database mydb = _db;
    await mydb.delete('transac',where: "id = ?",whereArgs: [trans.id]);
  }

  Future<void> insertClient(Client client) async{
    final Database mydb = _db;
    await mydb.insert('client', client.toMap(),conflictAlgorithm: ConflictAlgorithm.replace);
  }
  Future<List<Client>> clients() async{
    final Database mydb = await _db;
    final List<Map<String,dynamic>> maps = await mydb.query('client',orderBy: '-id');
    return List.generate(maps.length, (i){
      return Client(
        id: maps[i]['id'],
        name: maps[i]['name'],
        email: maps[i]['email'],
        mobile: maps[i]['mobile'],
      );
    });
  }
  Future<void> deleteClient(Client client) async{
    await _db.delete('client',where: "id = ?",whereArgs: [client.id]);
  }
  Future<void> updateClient(Client client) async{
    await _db.update('dogs',client.toMap(),where: "id = ?", whereArgs: [client.id]);
  }
  // Future<Client> upsertClient(Client client) async {
  //   if (client.id != null) {
  //     await _db.update("client", client.toMap(),
  //         where: "id = ?", whereArgs: [client.id]);
  //   } else {
  //     client.id = await _db.insert("client", client.toMap());
  //   }
  //   return client;
  // }

  // Future<List<Client>> getClients() async {
  //   List<Map> clients = await _db.query('client',
  //       columns: Client.columns,
  //       orderBy: "id");
  //   return clients.map((client) => Client.fromMap((client)));
  // }

  // // Future<User> upsertUser(User user) async {
  // //   var count = Sqflite.firstIntValue(await _db
  // //       .rawQuery("SELECT COUNT(*) FROM user WHERE mobile = ?", [user.mobile]));
  // //   if (count == 0) {
  // //     user.id = await _db.insert("user", user.toMap());
  // //   } else {
  // //     await _db
  // //         .update("user", user.toMap(), where: "id = ?", whereArgs: [user.id]);
  // //   }
  // //   return user;
  // // }

  // Future<Transac> upsertTransaction(Transac transaction) async {
  //   if (transaction.id != null) {
  //     await _db.update('transac', transaction.toMap());
  //   } else {
  //     transaction.id = await _db.insert("transac", transaction.toMap());
  //   }
  //   return transaction;
  // }

  // // Future<Client> upsertClient(Client client) async{
  // //   if(client.id!=null){
  // //     await _db.update('client', client.toMap());
  // //   }else{
  // //     client.id = await _db.insert('client', client.toMap());
  // //   }
  // //   return client;
  // // }
  // // Future<List<Client>> fetchClientsOfUser(User user) async {
  // //   List<Map> clients = await _db.query('client',
  // //       columns: Client.columns,
  // //       where: "user_id = ?",
  // //       whereArgs: [user.id],
  // //       orderBy: "id");
  // //   return clients.map((client) => Client.fromMap((client)));
  // // }

  // Future<List<Transac>> fetchTransacOfClient(Client client) async {
  //   List<Map> transacs = await _db.query('transac',
  //       columns: Transac.columns,
  //       where: "client_id = ?",
  //       whereArgs: [client.id]);
  //   return transacs.map((transac) => Client.fromMap(transac));
  // }

  // // Future<User> fetchUser(String mobile) async {
  // //   var count = Sqflite.firstIntValue(await _db
  // //       .rawQuery("SELECT COUNT(*) FROM user WHERE mobile = ?", [mobile]));
  // //   if (count != 0) {
  // //     var user = await _db.query('user',
  // //         columns: User.columns, where: "mobile = ?", whereArgs: [mobile]);
  // //     return User.fromMap(user[0]);
  // //   } else {
  // //     throw new Exception('user not found');
  // //   }
  // // }
}
