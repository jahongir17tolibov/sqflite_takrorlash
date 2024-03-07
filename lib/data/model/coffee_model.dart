import 'package:sqflite_takrorlash/utils/database_constants.dart';

class CoffeeModel {
  final int? id;
  final String name;
  final String description;
  final String subtitle;
  final int price;
  final int categoryId;
  final int? count;
  final int isFavourite;

  CoffeeModel({
    this.id,
    required this.name,
    required this.description,
    required this.subtitle,
    required this.price,
    required this.categoryId,
    this.count,
    this.isFavourite = 0,
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
        DatabaseConstants.cmId: id,
        DatabaseConstants.cmName: name,
        DatabaseConstants.cmDescription: description,
        DatabaseConstants.cmSubtitle: subtitle,
        DatabaseConstants.cmPrice: price,
        DatabaseConstants.cmCategoryId: categoryId,
        DatabaseConstants.cmCount: count ?? 0,
        DatabaseConstants.cmIsFavourite: isFavourite,
      };

  factory CoffeeModel.fromJson(Map<String, dynamic> json) => CoffeeModel(
        id: json[DatabaseConstants.cmId],
        name: json[DatabaseConstants.cmName],
        description: json[DatabaseConstants.cmDescription],
        subtitle: json[DatabaseConstants.cmSubtitle],
        price: json[DatabaseConstants.cmPrice],
        categoryId: json[DatabaseConstants.cmCategoryId],
        count: json[DatabaseConstants.cmCount],
        isFavourite: json[DatabaseConstants.cmIsFavourite],
      );

  CoffeeModel copyWith({
    int? id,
    String? name,
    String? description,
    String? subtitle,
    int? price,
    int? categoryId,
    int? count,
    int? isFavourite,
  }) =>
      CoffeeModel(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        subtitle: subtitle ?? this.subtitle,
        price: price ?? this.price,
        categoryId: categoryId ?? this.categoryId,
        count: count ?? this.count,
        isFavourite: isFavourite ?? this.isFavourite,
      );
}
