import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite_takrorlash/data/model/coffee_model.dart';
import 'package:sqflite_takrorlash/data/repository/repository.dart';
import 'package:sqflite_takrorlash/presentation/favourites_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List<CoffeeModel> coffeeModel = [];

  FutureOr<void> _init() async {
    await Repository.initData();
    setState(() {});
    // coffeeModel = await Repository.getAllCoffees();
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        backgroundColor: Colors.indigo,
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              Navigator.of(context)
                  .push(CupertinoPageRoute(builder: (_) => const FavouritesScreen()))
                  .then((value) => setState(() {}));
            },
            icon: const Icon(Icons.favorite_outline),
          ),
          const SizedBox(width: 50),
        ],
      ),
      body: FutureBuilder(
        future: Repository.getAllCoffees(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          if (snapshot.hasData) {
            final List<CoffeeModel>? coffeeModel = snapshot.data;
            return ListView.builder(
              itemCount: coffeeModel!.length,
              itemBuilder: (context, index) {
                final coffee = coffeeModel[index];
                return ListTile(
                  title: Text(
                    coffee.name,
                    style: const TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  subtitle: Text(
                    coffee.price.toString(),
                    style: const TextStyle(color: Colors.black54, fontSize: 20),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        onPressed: () async {
                          await Repository.decreaseCoffee(coffee);
                          setState(() {});
                        },
                        icon: const Icon(Icons.remove),
                      ),
                      Text(
                        coffee.count.toString(),
                        style: const TextStyle(fontSize: 16),
                      ),
                      IconButton(
                        onPressed: () async {
                          await Repository.increaseCoffee(coffee);
                          setState(() {});
                        },
                        icon: const Icon(Icons.add),
                      ),
                      IconButton(
                        onPressed: () async {
                          final coffeeModelUpdated =
                              coffee.copyWith(isFavourite: (coffee.isFavourite == 0) ? 1 : 0);
                          await Repository.saveToFavourite(coffeeModelUpdated);
                          setState(() {});
                        },
                        icon: Icon(
                          (coffee.isFavourite == 0) ? Icons.favorite_outline : Icons.favorite,
                          color: Colors.red,
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          }

          return const Center(child: CupertinoActivityIndicator());
        },
      ),
    );
  }
}
