import 'package:sqflite_takrorlash/data/model/favourite_currencies_model.dart';

abstract class Repository {
  Future<void> syncCurrencies();

  Future<List<FavouriteCurrencyModel>> getAllCurrenciesFromApi();

  Future<void> saveToFavourites(FavouriteCurrencyModel model);

  Future<List<FavouriteCurrencyModel>> getAllFavourites();

  Future<void> deleteOneCurrencies(int id);

  Future<void> clearAllCurrencies();
}
