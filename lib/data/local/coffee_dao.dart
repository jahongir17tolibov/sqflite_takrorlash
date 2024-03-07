import 'package:sqflite_takrorlash/data/local/app_database.dart';
import 'package:sqflite_takrorlash/data/model/coffee_model.dart';
import 'package:sqflite_takrorlash/utils/database_constants.dart';

class CoffeeDao {
  static final AppDatabase database = AppDatabase.getInstance;

  static Future<int> insertCoffee(CoffeeModel coffeeModel) async {
    final db = await database.getDatabase();
    try {
      return await db.insert(DatabaseConstants.coffeeTableName, coffeeModel.toJson());
    } catch (_) {
      rethrow;
    }
  }

  static Future<List<CoffeeModel>> getAllCoffees() async {
    final db = await database.getDatabase();
    try {
      final data = await db.query(DatabaseConstants.coffeeTableName);
      return data.map((e) => CoffeeModel.fromJson(e)).toList();
    } catch (_) {
      rethrow;
    }
  }

  static Future<List<CoffeeModel>> getAllFavourites() async {
    final db = await database.getDatabase();
    try {
      final data = await db.query(
        DatabaseConstants.coffeeTableName,
        where: "${DatabaseConstants.cmIsFavourite} LIKE ?",
        whereArgs: ["${1}%"],
      );
      return data.map((e) => CoffeeModel.fromJson(e)).toList();
    } catch (_) {
      rethrow;
    }
  }

  static Future<void> updateIsFavourite(int id, int state) async {
    final db = await database.getDatabase();
    try {
      String sqlQuery = """
      UPDATE ${DatabaseConstants.coffeeTableName}
            SET ${DatabaseConstants.cmIsFavourite} = '$state'
            WHERE ${DatabaseConstants.cmId} = '$id'
      """;
      await db.rawQuery(sqlQuery);
    } catch (_) {
      rethrow;
    }
  }

  static Future<void> updateCount(int id, int count) async {
    final db = await database.getDatabase();
    try {
      String sqlQuery = """
      UPDATE ${DatabaseConstants.coffeeTableName}
            SET ${DatabaseConstants.cmCount} = '$count'
            WHERE ${DatabaseConstants.cmId} = '$id'
      """;
      await db.rawQuery(sqlQuery);
    } catch (_) {
      rethrow;
    }
  }

  static Future<int> deleteFromFavourites(int id) async {
    final db = await database.getDatabase();
    try {
      return await db.delete(
        DatabaseConstants.coffeeTableName,
        where: "${DatabaseConstants.cmId} = ?",
        whereArgs: [id],
      );
    } catch (_) {
      rethrow;
    }
  }
}
