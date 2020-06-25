import 'package:covid19_app/api/api.dart';
import 'package:covid19_app/models/country_model.dart';
import 'package:covid19_app/providers/countries_provider.dart';
import 'package:covid19_app/widgets/error_widget.dart';
import 'package:covid19_app/widgets/info_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final countryProvider =
        Provider.of<CountriesProvider>(context, listen: true);

    return Scaffold(
        body: (countryProvider.contries != null)
            ? (countryProvider.contries.length > 0)
                ? _cuerpo(context)
                : Center(
                    child: CircularProgressIndicator(),
                  )
            : ErrorDataWidget(aceptar: () {
                countryProvider.countries = [];
                Api.getDataGloblal(context)
                    .then((value) => print('ya termino x2'));
              }));
  }

  _cuerpo(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          _boton(context),
          Expanded(child: _listCountry(context))
        ]);
  }

  _listCountry(BuildContext context) {
    List<Country> countries =
        Provider.of<CountriesProvider>(context, listen: false).contries;
    return ListView.builder(
      itemCount: countries.length,
      itemBuilder: (BuildContext context, int index) {
        return _item(context, countries[index]);
      },
    );
  }

  _item(BuildContext context, Country country) {
    return ListTile(
      title: Text(country.country),
      subtitle: Text('Confirmados: ${country.totalConfirmed}'),
      onTap: () {
        showDialog(
            context: context,
            child: InformationDialog(
              country: country,
            ));
      },
    );
  }

  _boton(BuildContext context) {
    final countryProvider =
        Provider.of<CountriesProvider>(context, listen: false);
    return IconButton(
      icon: Icon(Icons.format_line_spacing),
      onPressed: () {
        List<Country> order = [];
        if (countryProvider.ascendingOrder) {
          order = Country().orderList(countryProvider.contries, false);
          countryProvider.ascendingOrder = false;
        } else {
          order = Country().orderList(countryProvider.contries, true);
          countryProvider.ascendingOrder = true;
        }
        countryProvider.countries = order;
      },
    );
  }
}
