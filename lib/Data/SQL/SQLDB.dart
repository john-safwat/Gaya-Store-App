import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class SQLdb{

  static Database? _db;

  Future<Database?> getDB() async{
    if(_db == null) {
      _db = await initiateDB();
      return _db;
    }else {
      return _db;
    }
  }

  initiateDB() async {
    String dataBasePath = await getDatabasesPath() ;
    String path = join( dataBasePath , 'Gaya Store.db') ;
    Database myDb = await openDatabase(path , onCreate: _onCreate , version: 1 ) ;
    return myDb ;
  }

  void _onCreate(Database db , int version) async {
    await db.execute('''
      CREATE TABLE `products` (
        `id` INTEGER NOT NULL,
        `name` text NOT NULL,
        `category` text UNSIGNED NOT NULL,
        `price` double(10,3) NOT NULL,
        `mainImage` text DEFAULT NULL,
        `brand` text UNSIGNED NOT NULL,
        `rating` double(4,2) NOT NULL
      )
    ''');
    print('data base created');
  }

  Future<String>insertData(String sql) async{
    Database? myDb = _db;
    var response =  await myDb!.rawInsert(sql);
    return "Product Added To Wish List";
  }

  Future<String>deleteData(String sql) async{
    Database? myDb = _db;
    var response =  await myDb!.rawDelete(sql);
    return "Product Delete From Wish List";
  }

  readData(String sql) async{
    Database? myDb = _db;
    var response =  await myDb!.rawQuery(sql);
    return response;
  }
}