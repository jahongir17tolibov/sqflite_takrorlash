import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:sqflite_takrorlash/data/model/currency_model.dart';
import 'package:sqflite_takrorlash/utils/app_constants.dart';

import '../model/my_response.dart';

class ApiProvider {
  static Future<MyResponse> getAllCurrencies() async {
    Uri uri = Uri.parse(AppConstants.baseUrl);
    try {
      final Response response = await get(uri);

      if (response.statusCode == 200) {
        final currencyData = (jsonDecode(response.body) as List?)
                ?.map((data) => CurrencyModel.fromJson(data))
                .toList() ??
            [];
        return MyResponse(data: currencyData);
      }
      return MyResponse(errorText: response.statusCode.toString());
    } catch (e, str) {
      debugPrintStack(stackTrace: str);
      print(e);
      return MyResponse(errorText: e.toString());
    }
  }
}
