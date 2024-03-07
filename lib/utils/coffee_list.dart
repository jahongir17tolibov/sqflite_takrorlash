import 'package:sqflite_takrorlash/data/model/category_model.dart';
import 'package:sqflite_takrorlash/data/model/coffee_model.dart';

class CoffeeUtils {
  static List<CoffeeModel> coffeeModelList = [
    CoffeeModel(
      name: 'Cappuccino',
      description: 'ejkbdwhebdbdjewdkd',
      subtitle: '10% sut bir nimalar',
      price: 100,
      categoryId: 10,
    ),
    CoffeeModel(
      name: 'Cappuccino2',
      description: 'ejkbdwhebdbdjewdkd',
      subtitle: '10% sut bir nimalar',
      price: 103,
      categoryId: 11,
    ),
    CoffeeModel(
      name: 'Cappuccino3',
      description: 'ejkbdwhebdbdjewdkd',
      subtitle: '10% sut bir nimalar',
      price: 10,
      categoryId: 11,
    ),
    CoffeeModel(
      name: 'Cappuccin4',
      description: 'ejkbdwhebdbdjewdkd',
      subtitle: '10% sut bir nimalar',
      price: 450,
      categoryId: 12,
    ),
    CoffeeModel(
      name: 'Cappuccino5',
      description: 'ejkbdwhebdbdjewdkd',
      subtitle: '10% sut bir nimalar',
      price: 200,
      categoryId: 10,
    ),
    CoffeeModel(
      name: 'Americano',
      description: 'ejkbdwhebdbdjewdkd',
      subtitle: '10% sut bir nimalar',
      price: 200,
      categoryId: 10,
    ),
    CoffeeModel(
      name: 'Espresso',
      description: 'ejkbdwhebdbdjewdkd',
      subtitle: '10% sut bir nimalar',
      price: 200,
      categoryId: 10,
    ),
    CoffeeModel(
      name: 'Latte',
      description: 'ejkbdwhebdbdjewdkd',
      subtitle: '10% sut bir nimalar',
      price: 200,
      categoryId: 10,
    ),
    CoffeeModel(
      name: 'Mocha',
      description: 'ejkbdwhebdbdjewdkd',
      subtitle: '10% sut bir nimalar',
      price: 200,
      categoryId: 10,
    ),
    CoffeeModel(
      name: 'Affogato',
      description: 'ejkbdwhebdbdjewdkd',
      subtitle: '10% sut bir nimalar',
      price: 200,
      categoryId: 10,
    ),
    CoffeeModel(
      name: 'Macchiato',
      description: 'ejkbdwhebdbdjewdkd',
      subtitle: '10% sut bir nimalar',
      price: 200,
      categoryId: 10,
    ),
    CoffeeModel(
      name: 'Flat White',
      description: 'ejkbdwhebdbdjewdkd',
      subtitle: '10% sut bir nimalar',
      price: 200,
      categoryId: 10,
    ),
    CoffeeModel(
      name: 'Cold Brew',
      description: 'ejkbdwhebdbdjewdkd',
      subtitle: '10% sut bir nimalar',
      price: 200,
      categoryId: 10,
    ),
    CoffeeModel(
      name: 'Cappuccino6',
      description: 'ejkbdwhebdbdjewdkd',
      subtitle: '10% sut bir nimalar',
      price: 104,
      categoryId: 13,
    ),
    CoffeeModel(
      name: 'Cappuccino7',
      description: 'ejkbdwhebdbdjewdkd',
      subtitle: '10% sut bir nimalar',
      price: 120,
      categoryId: 13,
    ),
    CoffeeModel(
      name: 'Cappuccino8',
      description: 'ejkbdwhebdbdjewdkd',
      subtitle: '10% sut bir nimalar',
      price: 200,
      categoryId: 11,
    ),
  ];

  static List<CategoryModel> categoryModelList = [
    CategoryModel(
      name: "American",
      categoryId: 10,
    ),
    CategoryModel(
      name: "African",
      categoryId: 11,
    ),
    CategoryModel(
      name: "Milk",
      categoryId: 12,
    ),
    CategoryModel(
      name: "Choco",
      categoryId: 13,
    ),
  ];
}
