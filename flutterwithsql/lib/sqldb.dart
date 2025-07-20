import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class SqlDB{
int? versionNumber;
Database? myDb;
  static Database? _db;
int insertone = 1;
  Future<Database?> get db async {
    if (_db == null){
      versionNumber = 2;
      debugPrint("refresh");
      _db = await intialDB();
      return _db;
    }
    else{
      return _db;
    }
    
  }
   
  String uiio = "mos";
  intialDB()async{
    String databasePath = await getDatabasesPath();
    String path = join(databasePath , "mostafa.db");
    debugPrint("$versionNumber");
    myDb = await openDatabase(
      path,onCreate: _onCreate,
      version: versionNumber , onUpgrade: _onUpgrade
    );
    return myDb;
  }
  _onUpgrade(Database db , int oldVersion , int newVersion)async{
    await db.execute("ALTER TABLE notes ADD COLUMN color TEXT");
    versionNumber = versionNumber! + 1;
    debugPrint("Update DataBase and version number : $versionNumber");
  }
  _onCreate(Database db, int version)async{
    Batch batch = db.batch();
    batch.execute('''
        CREATE TABLE "notes"(
        "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        "note" TEXT NOT NULL
        )
    ''');
    batch.execute('''
    CREATE TABLE "student"(
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL)
''');
  await batch.commit();
    debugPrint("Create DataBase And Table");
  }
  read(String table)async {
    Database? mydb = await db;
    List<Map> response = await mydb!.query(table);
    return response;
  }
   insert(String table , Map<String,Object?> values)async {
    if(insertone != 1){
      await myDb?.close();
      _db = null;
      insertone = 1;
    }
    Database? mydb = await db;
    int response = await mydb!.insert(table,values);
    return response;
  }
  update(String table , Map<String,Object?> valuesUpdate,String? whereParameter)async {
    Database? mydb = await db;
    int response = await mydb!.update(table,valuesUpdate,where: whereParameter);
    return response;
  }
  delete(String table , String? whereParameter)async {
    Database? mydb = await db;
    int response = await mydb!.delete(table,where: whereParameter);
    return response;
  }
  readData(String sql)async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }
   insertData(String sql)async {
    if(insertone != 1){
      await myDb?.close();
      _db = null;
      insertone = 1;
    }
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }
  updateData(String sql)async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }
  deleteData(String sql)async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }
  mydeleteDatabase()async{
    String databasePath = await getDatabasesPath();
    String path = join(databasePath,"mostafa.db");
    await deleteDatabase(path);
    versionNumber = 1;
    insertone = 2;
    await intialDB();
    // versionNumber = 2;
  } 
}
