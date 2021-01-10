import 'package:kassim/models/student.dart';

import '../models/prices.dart';

import '../models/city.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper.internal();
  factory DbHelper() => _instance;
  DbHelper.internal();
  static Database _db;

  //Database Name
  static const _DatabaseName = 'Kaasim.db';

  //Cities Table
  //
  static const _CitiesTable = 'Cities';
  static const _CitiesIdColumn = 'id';
  static const _CitiesNameColumn = 'City';
  //
  //

  //Prices Table
  //
  static const _PricesTable = 'Prices';
  static const _GradeId = 'gradeId';
  static const _MonthPrice = 'monthPrice';
  static const _Note1Price = 'note1Price';
  static const _Note2Price = 'note2Price';
  //
  //

  //
  //Student Table
  static const _StudentTable = 'Student';
  static const _StudentId = 'studentId';
  static const _StudentName = 'studentName';
  static const _StudentPhone = 'studentPhone';
  static const _StudentCity = 'studentCity';
  static const _Month1 = 'month1';
  static const _Month2 = 'month2';
  static const _Month3 = 'month3';
  static const _Month4 = 'month4';
  static const _Month5 = 'month5';
  static const _Month6 = 'month6';
  static const _Month7 = 'month7';
  static const _Month8 = 'month8';
  static const _Month9 = 'month9';
  static const _Month10 = 'month10';
  static const _Month11 = 'month11';
  static const _Month12 = 'month12';
  static const _Note1 = 'note1';
  static const _Note2 = 'note2';
  //
  //

  //Creating the database
  Future<Database> creatDatabase() async {
    if (_db != null) {
      return _db;
    }
    //DATABASE PATH
    String path = join(await getDatabasesPath(), _DatabaseName);
    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int v) {
        //Cities Table Createtion
        db.execute(
            'CREATE TABLE $_CitiesTable ($_CitiesIdColumn INTEGER PRIMARY KEY AUTOINCREMENT, $_CitiesNameColumn varchar(50))');

        db.execute(
            'CREATE TABLE $_PricesTable ($_GradeId INTEGER , $_MonthPrice INTEGER, $_Note1Price INTEGER , $_Note2Price INTEGER)');
        db.execute(
            'INSERT INTO $_PricesTable ($_GradeId , $_MonthPrice , $_Note1Price, $_Note2Price) VALUES (1,80,30,50) ');
        db.execute(
            'INSERT INTO $_PricesTable ($_GradeId , $_MonthPrice , $_Note1Price, $_Note2Price) VALUES (2,90,40,60) ');
        db.execute(
            'INSERT INTO $_PricesTable ($_GradeId , $_MonthPrice , $_Note1Price, $_Note2Price) VALUES (3,100,50,70) ');
        db.execute(
            'CREATE TABLE $_StudentTable ($_StudentId INTEGER PRIMARY KEY AUTOINCREMENT , $_StudentName varchar(255) , $_StudentPhone INTEGER , $_StudentCity VARCHAR(100) ,  $_Month1 BOOLEAN , $_Month2 BOOLEAN , $_Month3 BOOLEAN , $_Month4 BOOLEAN , $_Month5 BOOLEAN , $_Month6 BOOLEAN , $_Month7 BOOLEAN , $_Month8 BOOLEAN , $_Month9 BOOLEAN , $_Month10 BOOLEAN , $_Month11 BOOLEAN , $_Month12 BOOLEAN , $_Note1 BOOLEAN , $_Note2 BOOLEAN)');
      },
    );
    return _db;
  }

  //Adding new city into _CitiesTable
  Future<int> newCity(City city) async {
    Database db = await creatDatabase();
    return db.insert(_CitiesTable, city.toMap());
  }

  //Get all the cities to list
  Future<List> allCities() async {
    Database db = await creatDatabase();
    return db.query(_CitiesTable);
  }

  //Delete a city
  Future<int> deleteCity(int id) async {
    Database db = await creatDatabase();
    return db.delete(
      _CitiesTable,
      where: '$_CitiesIdColumn = ?',
      whereArgs: [id],
    );
  }

  //Delete All the cities
  //
  //

  //Update a City
  Future<int> updateCity(City city) async {
    Database db = await creatDatabase();
    return db.update(
      _CitiesTable,
      city.toMap(),
      where: '$_CitiesIdColumn = ?',
      whereArgs: [city.id],
    );
  }

  Future<List> allPrices() async {
    Database db = await creatDatabase();
    return db.query(_PricesTable);
  }

  Future<int> updatePrice(Prices prices) async {
    Database db = await creatDatabase();
    return db.update(
      _PricesTable,
      prices.toMap(),
      where: '$_GradeId = ?',
      whereArgs: [prices.gradeId],
    );
  }

  getPrice() async {
    Database db = await creatDatabase();
    return db.rawQuery(
        'Select $_MonthPrice from $_PricesTable where $_GradeId = 1 ');
  }

  //Get all the sudents to list
  Future<List> allStudents() async {
    Database db = await creatDatabase();
    return db.query(_StudentTable);
  }

  Future<int> newStudent(Student student) async {
    Database db = await creatDatabase();
    return db.insert(_StudentTable, student.toMap());
  }

  Future<int> updateStudent(Student student) async {
    Database db = await creatDatabase();
    return db.update(
      _StudentTable,
      student.toMap(),
      where: '$_StudentId = ?',
      whereArgs: [student.studentId],
    );
  }

  Future<int> deleteStudent(int id) async {
    Database db = await creatDatabase();
    return db.delete(
      _StudentTable,
      where: '$_StudentId = ?',
      whereArgs: [id],
    );
  }
}
