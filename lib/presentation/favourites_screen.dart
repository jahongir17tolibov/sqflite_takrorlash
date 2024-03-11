import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite_takrorlash/data/model/favourite_currencies_model.dart';
import 'package:sqflite_takrorlash/data/repository/repository.dart';
import 'package:sqflite_takrorlash/data/repository/repository_impl.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  final Repository repository = RepositoryImpl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourites Screen'),
        backgroundColor: Colors.amber,
        leading: IconButton(
          onPressed: () async {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: FutureBuilder(
        future: repository.getAllFavourites(),
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
                final coffee = currencyModel[index];
                return ListTile(
                  title: Text(
                    coffee.ccyName,
                    style: const TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  subtitle: Text(
                    coffee.code.toString(),
                    style: const TextStyle(color: Colors.black54, fontSize: 20),
                  ),
                  trailing: IconButton(
                    onPressed: () async {
                      final model = coffee.copyWith(isFavourite: 0);
                      await repository.saveToFavourites(model);
                      setState(() {});
                    },
                    icon: const Icon(
                      Icons.delete,
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
