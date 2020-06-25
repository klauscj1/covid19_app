import 'dart:convert';

import 'package:covid19_app/models/country_model.dart';
import 'package:covid19_app/models/sumary_model.dart';
import 'package:covid19_app/providers/countries_provider.dart';
import 'package:covid19_app/utils/strings_util.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Api {
  static Future<void> getDataGloblal(BuildContext context) async {
    try {
      var response = await http.get(apiUrl + "summary");
      var jsonData = json.decode(response.body);
      //print(jsonData);
      if (response.statusCode == 200) {
        Sumary resumen = Sumary.fromJson(jsonData);
        // print('todo ok con summary: ${summary.countries.length}');
        List<Country> countries = Country().orderList(
            resumen.countries,
            Provider.of<CountriesProvider>(context, listen: false)
                .ascendingOrder);
        Provider.of<CountriesProvider>(context, listen: false).countries =
            countries;
        Provider.of<CountriesProvider>(context, listen: false).global =
            resumen.global;
        Provider.of<CountriesProvider>(context, listen: false).ascendingOrder =
            false;
        return;
      } else {
        //print('todo...');
        Provider.of<CountriesProvider>(context, listen: false).countries = null;
        Provider.of<CountriesProvider>(context, listen: false).global = null;
        return;
      }
    } catch (err) {
      //print('errr: $err');
      Provider.of<CountriesProvider>(context, listen: false).countries = null;
      Provider.of<CountriesProvider>(context, listen: false).global = null;
      return;
    }
  }
}
