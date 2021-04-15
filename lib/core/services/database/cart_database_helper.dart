import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/model/cart_product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CartDataBaseHelper {
  //private constructor
  CartDataBaseHelper._();
  static final CartDataBaseHelper dp = CartDataBaseHelper._();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDatabase();
    return _database;
  }

  initDatabase() async {
    //path that your database will be stored on
    String path = join(await getDatabasesPath(), 'CartDataBase.db');

    //version one as its first time you initialize your data
    return openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      //you create your database in>> UserDataBase.db and now we are going to add our table
      //here we will write query of sql

      //$columnId INTEGER PRIMARY KEY AUTOINCREMENT,
      await db.execute('''
      CREATE TABLE $kTableCart (
      $kColumnName TEXT NOT NULL,
      $kColumnImage TEXT NOT NULL,
      $kColumnPrice TEXT NOT NULL,
      $kColumnQuantity INTEGER NOT NULL,
      $kColumnProductId TEXT NOT NULL)
      ''');
    });
  }

  Future<void> insertUser(CartProductModel model) async {
    //to get database from getter method so that if its null will be initialized first
    var dbClient = await database;

    await dbClient.insert(kTableCart, model.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<CartProductModel>> getAllProduct() async {
    var dbClient = await database;
    List<Map> maps = await dbClient.query(kTableCart);

    List<CartProductModel> productList = maps.isNotEmpty
        ? maps.map((e) => CartProductModel.fromJson(e)).toList()
        : [];
    return productList;
  }

  ///Update
  updateProduct(CartProductModel model) async {
    var dbClient = await database;
    await dbClient.update(
      kTableCart,
      model.toJson(),
      where: '$kColumnProductId = ?',
      whereArgs: [model.productId],
    );
  }
}
