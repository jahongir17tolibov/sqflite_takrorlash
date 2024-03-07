import 'package:sqflite_takrorlash/data/local/coffee_dao.dart';
import 'package:sqflite_takrorlash/data/model/coffee_model.dart';
import 'package:sqflite_takrorlash/utils/coffee_list.dart';

class Repository {
  static Future<void> initData() async {
    final List<CoffeeModel> allCoffees = await CoffeeDao.getAllCoffees();
    try {
      if (allCoffees.isEmpty) {
        for (CoffeeModel element in CoffeeUtils.coffeeModelList) {
          await CoffeeDao.insertCoffee(element);
        }
      }
    } catch (_) {
      rethrow;
    }
  }

  static Future<void> increaseCoffee(CoffeeModel model) =>
      CoffeeDao.updateCount(model.id!, (model.count! >= 0) ? model.count! + 1 : model.count!);

  static Future<void> decreaseCoffee(CoffeeModel model) =>
      CoffeeDao.updateCount(model.id!, (model.count! == 0) ? model.count! : model.count! - 1);

  static Future<List<CoffeeModel>> getAllCoffees() => CoffeeDao.getAllCoffees();

  static Future<void> saveToFavourite(CoffeeModel model) async =>
      CoffeeDao.updateIsFavourite(model.id!, model.isFavourite);

  static Future<List<CoffeeModel>> getAllFavouriteCoffees() => CoffeeDao.getAllFavourites();

  static Future<int> deleteFavouriteCoffee(int id) => CoffeeDao.deleteFromFavourites(id);
}
