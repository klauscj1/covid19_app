import 'package:covid19_app/models/country_model.dart';
import 'package:covid19_app/models/global_model.dart';
import 'package:flutter/material.dart';

class CountriesProvider with ChangeNotifier {
  List<Country> _countries = [];
  bool _ascendingOrder = false;
  Global _global = Global();

  set countries(List<Country> countries) {
    this._countries = countries;
    notifyListeners();
  }

  List<Country> get contries => _countries;

  set ascendingOrder(bool isOrderList) {
    this._ascendingOrder = isOrderList;
    notifyListeners();
  }

  bool get ascendingOrder => _ascendingOrder;

  set global(Global global) {
    this._global = global;
    notifyListeners();
  }

  Global get global => _global;
}
