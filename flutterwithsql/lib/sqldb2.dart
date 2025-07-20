import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlDb2{
  static Database? _db;
  Future<Database?> get db async{
    if (_db == null){
      _db = await initalDB();
      debugPrint("Created DataBase Successfully");
      return _db;
    }
    else{
      return _db;
    }
  }
  initalDB()async{
    String databasePath = await getDatabasesPath();
    String path = join(databasePath,"newdata.db");
    Database myDB = await openDatabase(path,onCreate: _onCreate,version: 2);
    return myDB;
  }
  _onCreate(Database db , int version)async{
    await db.execute('''
    CREATE TABLE "marks"(
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "arabic" INTEGER NOT NULL,
    "english" INTEGER NOT NULL,
    "frensh" INTEGER NOT NULL,
    "chimestry" INTEGER NOT NULL,
    "physics" INTEGER NOT NULL,
    "math" INTEGER NOT NULL
    )
''');
  }
readData(String sql)async{
  Database? mydb = await db;
  List<Map> response = await mydb!.rawQuery(sql);
  return response;
}
insertData(String sql)async{
  Database? mydb = await db;
  int response = await mydb!.rawInsert(sql);
  if (response != 0){
    return "Successufully inserted on the row $response";
  }
  else{
    return "Failed inserted";
  }
}
updateData(String sql)async{
  Database? mydb = await db;
  int response = await mydb!.rawUpdate(sql);
  if (response != 0){
    return "Successufully updata $response";
  }
  else{
    return "Failed updata";
  }
}
deleteData(String sql)async{
  Database? mydb = await db;
  int response = await mydb!.rawDelete(sql);
  if (response != 0){
    return "Successufully delete $response";
  }
  else{
    return "Failed delete";
  }
}
}