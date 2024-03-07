import 'package:sqflite_takrorlash/utils/database_constants.dart';

class CategoryModel {
  final int? id;
  final String? name;
  final int? categoryId;

  CategoryModel({this.id, this.name, this.categoryId});

  Map<String, dynamic> toJson() => <String, dynamic>{
        DatabaseConstants.cmId: id,
        DatabaseConstants.cmCategoryName: name,
        DatabaseConstants.cmCategoryId: categoryId,
      };

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json[DatabaseConstants.cmId],
        name: json[DatabaseConstants.cmCategoryName],
        categoryId: json[DatabaseConstants.cmCategoryId],
      );
}
