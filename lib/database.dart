import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

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
}
