import 'dart:core';
import 'package:payement_integration/Pages/home_page/model/car_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlCarService {
  static Database? _db;
  static final SqlCarService sqlDatabase = SqlCarService._privateConstructor();
  final String _carsTableName = "cars"; // TABLE NAME
  final String _carsIdColumnName = "id"; // CAR ID COLUMN
  final String _carsImageColumnName = 'image'; // CAR IMAGE COLUMN
  final String _carsModelColumnName = "model"; // CAR MODEL COLUMN
  final String _carsPriceColumnName = 'price'; // CAR PRICE COLUMN
  SqlCarService._privateConstructor();

  // -------- USING THIS TO CHECK IF DATABASE IS NULL OR NOT -----------
  // -------- IF NOT NULL THEN RETURN DATABASE--------------------------
  // -------- IF NULL THEN GETDATABASE THEN RETURN DATABASE ----------->
  Future<Database> get database async {
    if (_db != null) {
      return _db!;
    } else {
      _db = await getDatabase();
      return _db!;
    }
  }

  // ------- CREATING DATABASE & TABLE -------->

  Future<Database> getDatabase() async {
    final filePath = await getDatabasesPath();
    final databasePath =
        join(filePath, "master_db.db"); // DEFINING PATH OF DATABASE

    final database = await openDatabase(
      databasePath,
      version: 1,

      // ACTUAL TABLE CREATED
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE $_carsTableName(
            $_carsIdColumnName INTEGER PRIMARY KEY,
            $_carsImageColumnName TEXT NOT NULL,
            $_carsModelColumnName TEXT NOT NULL,
            $_carsPriceColumnName TEXT NOT NULL,
          ),
           
        ''');
      },
    );
    return database;
  }

  // -------------- INSERT DATA INTO TABLE ------------>

  // Future<void> addCar({
  //   required String carImage,
  //   required String carModel,
  //   required String carPrice,
  // }) async {
  //   final db = await database;
  //   await db.insert(
  //     _carsTableName,
  //     {
  //       _carsImageColumnName: carImage,
  //       _carsModelColumnName: carModel,
  //       _carsPriceColumnName: carPrice,
  //     },
  //   );
  //   print("$_carsImageColumnName,$_carsModelColumnName,$_carsPriceColumnName");
  // }

  void addCar(CarModel cardata) async {
    final db = await database;
    await db.insert(_carsTableName, {
      _carsImageColumnName: cardata.carImage,
      _carsModelColumnName: cardata.carName,
      _carsPriceColumnName: cardata.carPrice,
    });
  }
}
