import 'package:covid19_app/api/api.dart';
import 'package:covid19_app/models/global_model.dart';
import 'package:covid19_app/providers/countries_provider.dart';
import 'package:covid19_app/widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GlobalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final countryProvider =
        Provider.of<CountriesProvider>(context, listen: true);

    return Scaffold(
        body: (countryProvider.global != null)
            ? (countryProvider.global.totalDeaths != null &&
                    countryProvider.global.totalDeaths > 0)
                ? _cuerpo(context)
                : Center(
                    child: CircularProgressIndicator(),
                  )
            : ErrorDataWidget(aceptar: () {
                countryProvider.global = Global(totalDeaths: 0);
                Api.getDataGloblal(context)
                    .then((value) => print('ya termino x2'));
              }));
  }

  Widget _cuerpo(BuildContext context) {
    final global = Provider.of<CountriesProvider>(context, listen: true).global;
    return ListView(
      padding: const EdgeInsets.all(12.0),
      children: <Widget>[
        Text(
          'Hoy',
          style: Theme.of(context).textTheme.headline6,
        ),
        Divider(
          indent: 0,
          endIndent: 1,
          height: 10,
        ),
        ListTile(
          title: Text('${global.newConfirmed}'),
          subtitle: Text('Nuevos casos confirmados'),
          leading: Icon(
            Icons.new_releases,
            color: Colors.yellow,
          ),
        ),
        ListTile(
          title: Text('${global.newRecovered}'),
          subtitle: Text('Nuevos casos recuperados'),
          leading: Icon(
            Icons.check_box,
            color: Colors.blue,
          ),
        ),
        ListTile(
          title: Text('${global.newDeaths}'),
          subtitle: Text('Nuevas muertes'),
          leading: Icon(
            Icons.cancel,
            color: Colors.red,
          ),
        ),
        Text(
          'Resumen',
          style: Theme.of(context).textTheme.headline6,
        ),
        Divider(
          indent: 0,
          endIndent: 1,
          height: 10,
        ),
        ListTile(
          title: Text('${global.totalConfirmed}'),
          subtitle: Text('Total casos confirmados'),
          leading: Icon(
            Icons.new_releases,
            color: Colors.yellow,
          ),
        ),
        ListTile(
          title: Text('${global.totalRecovered}'),
          subtitle: Text('Total casos recuperados'),
          leading: Icon(
            Icons.check_box,
            color: Colors.blue,
          ),
        ),
        ListTile(
          title: Text('${global.totalDeaths}'),
          subtitle: Text('Total muertes'),
          leading: Icon(
            Icons.cancel,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
