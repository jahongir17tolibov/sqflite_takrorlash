import 'package:sqflite_takrorlash/data/local/app_database.dart';
import 'package:sqflite_takrorlash/data/model/favourite_currencies_model.dart';
import 'package:sqflite_takrorlash/utils/database_constants.dart';

class CurrenciesDao {
  static final AppDatabase database = AppDatabase.getInstance;

  static Future<int> insertCurrency(FavouriteCurrencyModel currencyModel) async {
    final db = await database.getDatabase();
    try {
      return await db.insert(DatabaseConstants.favCurrenciesTable, currencyModel.toJson());
    } catch (_) {
      rethrow;
    }
  }

  static Future<List<FavouriteCurrencyModel>> getAllCurrencies() async {
    final db = await database.getDatabase();
    try {
      String sqlQuery = """
      SELECT * FROM ${DatabaseConstants.favCurrenciesTable}
      """;
      final data = await db.rawQuery(sqlQuery);
      return data.map((e) => FavouriteCurrencyModel.fromJson(e)).toList();
    } catch (_) {
      rethrow;
    }
  }

  static Future<int> deleteFromFavourites(int id) async {
    final db = await database.getDatabase();
    try {
      return await db.delete(
        DatabaseConstants.favCurrenciesTable,
        where: "${DatabaseConstants.cmId} = ?",
        whereArgs: [id],
      );
    } catch (_) {
      rethrow;
    }
  }

  static Future<void> clearAllCurrencies() async {
    final db = await database.getDatabase();
    try {
      String sqlQuery = """
      DELETE FROM ${DatabaseConstants.favCurrenciesTable}
      """;
      await db.rawQuery(sqlQuery);
    } catch (_) {
      rethrow;
    }
  }

  static Future<void> saveAsFavourite(int id, int state) async {
    final db = await database.getDatabase();
    try {
      String sqlQuery = """
  UPDATE ${DatabaseConstants.favCurrenciesTable}
        SET ${DatabaseConstants.cmIsFavourite} = '$state'
        WHERE ${DatabaseConstants.cmId} = '$id'
  """;
      await db.rawQuery(sqlQuery);
    } catch (_) {
      rethrow;
    }
  }

  static Future<List<FavouriteCurrencyModel>> getAllFavourites() async {
    final db = await database.getDatabase();
    try {
      final data = await db.query(
        DatabaseConstants.favCurrenciesTable,
        where: "${DatabaseConstants.cmIsFavourite} LIKE ?",
        whereArgs: ["${1}%"],
      );
      return data.map((e) => FavouriteCurrencyModel.fromJson(e)).toList();
    } catch (_) {
      rethrow;
    }
  }

// static Future<void> updateCount(int id, int count) async {
//   final db = await database.getDatabase();
//   try {
//     String sqlQuery = """
//   UPDATE ${DatabaseConstants.favCurrenciesTable}
//         SET ${DatabaseConstants.cmCount} = '$count'
//         WHERE ${DatabaseConstants.cmId} = '$id'
//   """;
//     await db.rawQuery(sqlQuery);
//   } catch (_) {
//     rethrow;
//   }
// }
}
