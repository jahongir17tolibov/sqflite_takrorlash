import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite_takrorlash/data/model/coffee_model.dart';
import 'package:sqflite_takrorlash/data/repository/repository.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
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
        future: Repository.getAllFavouriteCoffees(),
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
                    coffee.name!,
                    style: const TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  subtitle: Text(
                    coffee.price.toString(),
                    style: const TextStyle(color: Colors.black54, fontSize: 20),
                  ),
                  trailing: IconButton(
                    onPressed: () async {
                      final model = coffee.copyWith(isFavourite: 0);
                      await Repository.saveToFavourite(model);
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
