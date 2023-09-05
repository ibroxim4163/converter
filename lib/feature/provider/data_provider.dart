import 'package:flutter/material.dart';

import '../models/city_model.dart';

class DataProvider with ChangeNotifier {
  final TextEditingController controller1;
  final TextEditingController controller2;
  final List<CityModel> cities;
  String selectedOne = "USD";
  String selectedTwo = "EUR";
  String rate = "0";
  DataProvider({
    required this.controller1,
    required this.controller2,
    required this.cities,
  }) : rate = cities[1].rate.toString();

  void onChangeFirst(String? currecy) {
    final number = num.tryParse(currecy!) ?? 0;

    final currencyOne = cities
        .where(
          (element) => element.ccy.toString().trim() == selectedOne,
        )
        .toList();
    final currencyTwo = cities
        .where(
          (element) => element.ccy.toString().trim() == selectedTwo,
        )
        .toList();

    if (currencyOne.isNotEmpty && currencyTwo.isNotEmpty) {
      controller2.text =
          ((currencyOne[0].rate! * number) / currencyTwo[0].rate!).toString();
      notifyListeners();
    }
  }

  void onRateChanged() {
    final currencyOne = cities
        .where(
          (element) => element.ccy.toString().trim() == selectedOne,
        )
        .toList();
    final currencyTwo = cities
        .where(
          (element) => element.ccy.toString().trim() == selectedTwo,
        )
        .toList();

    if (currencyOne.isNotEmpty && currencyTwo.isNotEmpty) {
      rate = ((currencyOne[0].rate!) / currencyTwo[0].rate!).toStringAsFixed(2);
      notifyListeners();
    }
  }

  void dropDownOnChange1(String? currency) {
    selectedOne = currency ?? "";
    notifyListeners();
    onRateChanged();
  }

  void dropDownOnChange2(String? currency) {
    selectedTwo = currency ?? "";
    notifyListeners();
    onRateChanged();
  }
}
