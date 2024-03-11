import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sqflite_takrorlash/data/model/currency_model.dart';
import 'package:sqflite_takrorlash/data/model/favourite_currencies_model.dart';
import 'package:sqflite_takrorlash/data/repository/repository.dart';
import 'package:sqflite_takrorlash/data/repository/repository_impl.dart';
import 'package:sqflite_takrorlash/presentation/favourites_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Repository repository = RepositoryImpl();
  final List<CurrencyModel> currencyList = [];
  static const String _invokeMethod = 'invoke_currency_map';
  final MethodChannel _methodChannel = const MethodChannel('currencies_native');

  FutureOr<void> _init() async {
    await repository.syncCurrencies();
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
              await Navigator.of(context)
                  .push(CupertinoPageRoute(builder: (_) => const FavouritesScreen()))
                  .then((value) => setState(() {}));
            },
            icon: const Icon(Icons.favorite_rounded),
          ),
          const SizedBox(width: 20),
          const Icon(Icons.ac_unit_outlined)
        ],
      ),
      body: FutureBuilder(
        future: repository.getAllCurrenciesFromApi(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          if (snapshot.hasData) {
            final List<FavouriteCurrencyModel>? currencyModel = snapshot.data;

            if (currencyModel!.isEmpty) {
              return const Center(child: Text('Data is empty'));
            }

            return ListView.builder(
              itemCount: currencyModel.length,
              itemBuilder: (context, index) {
                final currency = currencyModel[index];
                return ListTile(
                  title: Text(
                    currency.ccyNameUz,
                    style: const TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  subtitle: Text(
                    currency.rate,
                    style: const TextStyle(color: Colors.black54, fontSize: 20),
                  ),
                  trailing: IconButton(
                    onPressed: () async {
                      final model =
                          currency.copyWith(isFavourite: (currency.isFavourite == 0) ? 1 : 0);
                      await repository.saveToFavourites(model);
                      setState(() {});
                    },
                    icon: Icon(
                      (currency.isFavourite == 0) ? Icons.favorite_outline : Icons.favorite,
                      color: Colors.red,
                    ),
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
