import 'package:sqflite_takrorlash/utils/database_constants.dart';

import 'currency_model.dart';

class FavouriteCurrencyModel {
  final int? id;
  final int currencyId;
  final int code;
  final String ccyName;
  final String ccyNameRu;
  final String ccyNameUz;
  final String ccyNameKr;
  final String ccyNameEn;
  final String nominal;
  final String rate;
  final String diff;
  final String date;
  final int isFavourite;

  FavouriteCurrencyModel({
    this.id,
    required this.currencyId,
    required this.code,
    required this.ccyName,
    required this.ccyNameRu,
    required this.ccyNameUz,
    required this.ccyNameKr,
    required this.ccyNameEn,
    required this.nominal,
    required this.rate,
    required this.diff,
    required this.date,
    this.isFavourite = 0,
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
        DatabaseConstants.cmId: id,
        DatabaseConstants.cmCurrencyId: currencyId,
        DatabaseConstants.cmCode: code,
        DatabaseConstants.cmCcyName: ccyName,
        DatabaseConstants.cmCcyNameRu: ccyNameRu,
        DatabaseConstants.cmCcyNameUz: ccyNameUz,
        DatabaseConstants.cmCcyNameKr: ccyNameKr,
        DatabaseConstants.cmCcyNameEn: ccyNameEn,
        DatabaseConstants.cmNominal: nominal,
        DatabaseConstants.cmRate: rate,
        DatabaseConstants.cmDate: date,
        DatabaseConstants.cmDiff: diff,
        DatabaseConstants.cmIsFavourite: isFavourite,
      };

  factory FavouriteCurrencyModel.fromJson(Map<String, dynamic> json) => FavouriteCurrencyModel(
        id: json[DatabaseConstants.cmId],
        currencyId: json[DatabaseConstants.cmCurrencyId],
        code: json[DatabaseConstants.cmCode],
        ccyName: json[DatabaseConstants.cmCcyName],
        ccyNameRu: json[DatabaseConstants.cmCcyNameRu],
        ccyNameUz: json[DatabaseConstants.cmCcyNameUz],
        ccyNameKr: json[DatabaseConstants.cmCcyNameKr],
        ccyNameEn: json[DatabaseConstants.cmCcyNameEn],
        nominal: json[DatabaseConstants.cmNominal],
        rate: json[DatabaseConstants.cmRate],
        diff: json[DatabaseConstants.cmDiff],
        date: json[DatabaseConstants.cmDate],
        isFavourite: json[DatabaseConstants.cmIsFavourite],
      );

  factory FavouriteCurrencyModel.fromCurrencyModel(CurrencyModel currencyModel) =>
      FavouriteCurrencyModel(
        currencyId: currencyModel.id.toInt(),
        code: int.parse(currencyModel.code),
        ccyName: currencyModel.ccyName,
        ccyNameRu: currencyModel.ccyNameRu,
        ccyNameUz: currencyModel.ccyNameUz,
        ccyNameKr: currencyModel.ccyNameKr,
        ccyNameEn: currencyModel.ccyNameEn,
        nominal: currencyModel.nominal,
        rate: currencyModel.rate,
        diff: currencyModel.diff,
        date: currencyModel.date,
      );

  FavouriteCurrencyModel copyWith({
    int? id,
    int? currencyId,
    int? code,
    String? ccyName,
    String? ccyNameRu,
    String? ccyNameUz,
    String? ccyNameKr,
    String? ccyNameEn,
    String? nominal,
    String? rate,
    String? diff,
    String? date,
    int? isFavourite,
  }) =>
      FavouriteCurrencyModel(
        id: id ?? this.id,
        currencyId: currencyId ?? this.currencyId,
        code: code ?? this.code,
        ccyName: ccyName ?? this.ccyName,
        ccyNameRu: ccyNameRu ?? this.ccyNameRu,
        ccyNameUz: ccyNameUz ?? this.ccyNameUz,
        ccyNameKr: ccyNameKr ?? this.ccyNameKr,
        ccyNameEn: ccyNameEn ?? this.ccyNameEn,
        nominal: nominal ?? this.nominal,
        rate: rate ?? this.rate,
        diff: diff ?? this.diff,
        date: date ?? this.date,
        isFavourite: isFavourite ?? this.isFavourite,
      );
}
