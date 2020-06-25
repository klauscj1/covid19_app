import 'package:covid19_app/api/api.dart';
import 'package:covid19_app/pages/countries_page.dart';
import 'package:covid19_app/pages/global_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  //
  @override
  Widget build(BuildContext context) {
    Api.getDataGloblal(context).then((value) => print('ya termino'));
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
              title: Text('Covid 19'),
              bottom: TabBar(tabs: [
                Tab(
                  icon: Icon(Icons.location_city),
                  text: 'Por paises',
                ),
                Tab(
                  icon: Icon(Icons.public),
                  text: 'Estado Global',
                )
              ])),
          body: TabBarView(
            children: [CountriesPage(), GlobalPage()],
          )),
    );
  }
}
