import 'package:sqflite_takrorlash/data/local/currencies_dao.dart';
import 'package:sqflite_takrorlash/data/model/currency_model.dart';
import 'package:sqflite_takrorlash/data/model/favourite_currencies_model.dart';
import 'package:sqflite_takrorlash/data/remote/api_provider.dart';
import 'package:sqflite_takrorlash/data/repository/repository.dart';

class RepositoryImpl implements Repository {
  @override
  Future<void> syncCurrencies() async {
    final getAllCurrenciesApi = await ApiProvider.getAllCurrencies();
    final getAllCurrenciesDb = await CurrenciesDao.getAllCurrencies();
    try {
      if (getAllCurrenciesDb.isEmpty) {
        if (getAllCurrenciesApi.errorText == null) {
          final currencies = (getAllCurrenciesApi.data as List<CurrencyModel>?)
              ?.map((data) => FavouriteCurrencyModel.fromCurrencyModel(data))
              .toList();
          for (var data in currencies!) {
            await CurrenciesDao.insertCurrency(data);
          }
        }
      } else {
        // clear
        // for insert
      }
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<FavouriteCurrencyModel>> getAllCurrenciesFromApi() async =>
      CurrenciesDao.getAllCurrencies();

  @override
  Future<void> clearAllCurrencies() => CurrenciesDao.clearAllCurrencies();

  @override
  Future<void> deleteOneCurrencies(int id) => CurrenciesDao.deleteFromFavourites(id);

  @override
  Future<void> saveToFavourites(FavouriteCurrencyModel model) async {
    await CurrenciesDao.saveAsFavourite(model.id!, model.isFavourite);
  }

  @override
  Future<List<FavouriteCurrencyModel>> getAllFavourites() => CurrenciesDao.getAllFavourites();
}
