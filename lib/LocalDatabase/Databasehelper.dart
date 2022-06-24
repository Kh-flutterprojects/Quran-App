
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'Reader.dart';


class Databasehelper {
  static final _databaseName = "reader.db";
  static final _databaseVersion = 1;


  static final _table = "audio_table";
  static final readerName = "name";
  static final soraName = "soraname";
  static final soraUrl = "soraurl";
  static final readerImagePath = "path";
  static final isFav= "favorite";


  Databasehelper._privateConstructor();

  static final Databasehelper instance = Databasehelper._privateConstructor();
  static late Database _database;

  _initDatabase() async {
    String path = join(await getDatabasesPath(),_databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

//geter for databae file
  get database async {
    //if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

// this method use to create tables in database file
  _onCreate(Database db, int version) async {
    await db.execute(
        'create table $_table($readerName text, $soraName text, $soraUrl text ,$isFav text ,$readerImagePath text )');
  }


  //Future<int> this only use to return the value of id when the id defined as primary key autoincrement
   insert(Reader b,i) async {
    Database db = await instance.database;
    //db.execute("insert into $_table($columnName, $columnPrice) values(${b.name}, ${b.price})");
    return await db.insert(_table, {readerName: b.readerName, soraName: b.soraName[i],soraUrl:b.url[i],isFav:b.isFav,readerImagePath:b.readerImagePath});
  }



  delete(name,sora) async {
    Database db = await instance.database;
    print(name+" "+sora);
    return await db.delete(_table, where: '$readerName=? and $soraName=?', whereArgs: [name,sora]);
  }


  deleteAll() async {
    Database db = await instance.database;
    return await db.delete(_table);
  }

   Future<int> update(Sora b) async {
    Database db = await instance.database;
    return await db.update(_table, b.toMap(), where:  '$soraName=? and $readerName=?', whereArgs: [b.soraName,b.readerName]);
  }

  Future<List<Map<String, Object?>>> GetAllSoras() async {
    Database db = await instance.database;
    return await db.query(_table);
  }

  Future<List<Map<String, Object?>>> FindSoraByName(sora) async{
    Database db = await instance.database;
    return await db.query(_table, where: "$soraName like '%$sora%'");
  }

  Future<List<Map<String, Object?>>> FindSoraByIsFav(isFavo) async{
    Database db = await instance.database;
    return await db.query(_table, where: "$isFav like '%$isFavo%'");
  }


}
