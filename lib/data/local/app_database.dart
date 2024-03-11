import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_takrorlash/utils/database_constants.dart';

class AppDatabase {
  static AppDatabase getInstance = AppDatabase._init();

  static const String _databaseName = 'api_with_sqflite_app.db';
  static const int _databaseVersion = 1;
  Database? _database;

  AppDatabase._init();

  Future<Database> getDatabase() async {
    _database ??= await getDatabaseInstance(_databaseName);
    return _database!;
  }

  Future<Database> getDatabaseInstance(String databaseName) async {
    final String databasePath = await getDatabasePath();
    return await openDatabase(
      databasePath,
      version: _databaseVersion,
      onCreate: _onCreateDatabase,
    );
  }

  Future<void> _onCreateDatabase(Database db, int version) async {
    const String stringType = 'TEXT';
    const String intType = 'INTEGER';
    await db.execute("""
    CREATE TABLE ${DatabaseConstants.favCurrenciesTable}(
                 ${DatabaseConstants.cmId} INTEGER PRIMARY KEY AUTOINCREMENT,
                 ${DatabaseConstants.cmCurrencyId} $intType,
                 ${DatabaseConstants.cmCode} $intType,
                 ${DatabaseConstants.cmCcyName} $stringType,
                 ${DatabaseConstants.cmCcyNameRu} $stringType,
                 ${DatabaseConstants.cmCcyNameUz} $stringType,
                 ${DatabaseConstants.cmCcyNameKr} $stringType,
                 ${DatabaseConstants.cmCcyNameEn} $stringType,
                 ${DatabaseConstants.cmNominal} $stringType,
                 ${DatabaseConstants.cmRate} $stringType,
                 ${DatabaseConstants.cmDate} $stringType,
                 ${DatabaseConstants.cmDiff} $stringType,
                 ${DatabaseConstants.cmIsFavourite} $intType
    )""");

    // await db.execute("""
    // CREATE TABLE ${DatabaseConstants.categoryTableName}(
    //              ${DatabaseConstants.cmId} INTEGER PRIMARY KEY AUTOINCREMENT,
    //              ${DatabaseConstants.cmCategoryName} $stringType,
    //              ${DatabaseConstants.cmCategoryId} $intType
    // )""");
  }

  Future<String> getDatabasePath() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    return join(documentsDirectory.path, _databaseName);
  }
}
